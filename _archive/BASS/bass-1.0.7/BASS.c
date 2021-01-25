/*
BASS.c

Author: Liraz Siri <liraz@bigfoot.com>

Copyright (c) 1998 Liraz Siri <liraz@bigfoot.com>, Ariel, Israel,
              All rights reserved.

Created: Wed Dec  2 14:35:24 IST 1998

Bulk Auditing Security Scanner (pressbox style scheduler).
*/

/* 	$Id: BASS.c,v 2.0 1998/12/14 21:56:42 blood Exp $	 */

#ifndef lint
static char vcid[] = "$Id: BASS.c,v 2.0 1998/12/14 21:56:42 blood Exp $";
#endif /* lint */

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <errno.h>
#include <signal.h>
#include <sys/param.h>

#include "list.h"
#include "readconf.h"
#include "BASS.h"

#include "network.h"
#include "timeaux.h"
#include "log.h"
#include "job.h"
#include "coward.h"

#include "cgihooks.h"
#include "hooks.h"
#include "rpc.h"

char *G_recovery_file = BASS_RECOVERY_FILE; /* global recovery file
						   definition */

void usage(char *av0, Options *options)
{
 fprintf(stderr,
         "BASS version %d.%d.%d (c) Siri Security Research 1998\n",
         BASS_VERSION,
         BASS_VERSION_MAJOR,
         BASS_VERSION_MINOR);
 fprintf(stderr, "Usage: %s [options] hostlist[s]\n" 
                 "-l file       Log file [%s]\n"
                 "-t seconds    Generic timeout definition [%d]\n"
                 "-j jpm        Jobs per minute [%d]\n"
		 "-c            Coward mode [%s]\n"
                 "-v            Verbose, log verbose events\n"
                 "-h            This help\n",

	         av0,
                 options->log_file,
                 options->generic_timer,
	         (int)options->jpm,
 	         options->coward_mode == ON ? "ON" : "OFF");
 exit(0);
}

int main(int argc, char **argv)
{
  int i, option;
  Options options;          /* global option definitions */
  char resolved_path[MAXPATHLEN];
  
  readconf_default(&options);

  if(geteuid() != 0)
          fprintf(stderr, "\
WARNING: BASS needs root privileges to access the low level ICMP
         interface that allows it to \"ping\" hosts for availability.
         You _may_ use BASS as a non root user, but this will disable pings,
         harming the efficiency of your scan, which will run slower.

");

  /* check to see if we crashed and burned earlier, and resume our previous
     occupation. */
  if(argc == 1)
    {
      if(recover_init(&options))
 	{
          /* feel free to comment this status print out */
          printf("BASS: recovering where we last crashed, "
                 "at %ld scanned hosts\n", options.recover_point);

	  /* make sure we don't have any console print leaks */
	  freopen("/dev/null", "w", stdout);
	  freopen("/dev/null", "w", stderr);
	  freopen("/dev/null", "r", stdin);
	  goto do_schedule;
	}
      else {
        printf("BASS (c) 1998-1999: "
               "nothing to recover from (-h for help)\n");
	exit(0);
      }
    }

  /* initialize our option values (hardcoded for now, but these should
     be read from a configuration file) */

  /* parse, dice and slice argument values from command line */
  while((option = getopt(argc, argv, "l:t:j:pvh")) != EOF)
    switch(option)
      {
      case 'l' :
	options.log_file = strdup(realpath(optarg, resolved_path)); 
	break;

      case 't' :
	options.generic_timer = atoi(optarg);

        if(options.generic_timer <= 0)
	  fatal("illegal timer value <%s>", optarg);
	    
	break;

      case 'j' :
	options.jpm = atof(optarg);

	if(options.jpm <= 0)
	  fatal("illegal jpm value <%s>", optarg);
	
	break;

      case 'c' :
	options.coward_mode = ON;
	break;

      case 'v' :
	options.verbose_mode = ON;
	break;

      case 'h' :
      default  :
	usage(argv[0], &options);
      }

  /* we have a bunch of hostlists,... right? */
  if(argc - optind < 1)
    usage(argv[0], &options);

  argc -= optind;
  argv += optind;

  for(i = 0; i < argc; i++)
    {
      realpath(argv[i], resolved_path);

      if(!access(resolved_path, R_OK))
        list_add(&options.host_lists, resolved_path, strlen(resolved_path)+1);
      else
        error("unable to access hostlist [for reading] <%s>", resolved_path);
    }

  argc += optind;
  argv -= optind;

 do_schedule:

  if(!list_len(&options.host_lists))
    fatal("unable to access ANY of the hostlists, nothing to work with!");

  if(log_init(BASS_PROGNAME, options.log_file) < 0)
    fatal("unable to initialize log <%s>", options.log_file);

  go_background();

  if(options.coward_mode == ON)
    coward_init(argc, argv);

  do_schedule(&options);
  /* NOT REACHED */
}
  
/* manage job tasks, using a constant JPM anchor (pressbox style) */
void do_schedule(Options *options)
{ 
 FILE *fp;

 char host[128];                      /* host address */

 unsigned long count_total = 0;       /* total hosts scanned */
 unsigned long count_hostlist;        /* total hosts in hostlist scanned */
 unsigned long recover_skip;          /* number of hosts to skip (after
					 a recover) */
 struct list *list_link;              /* hostlist linked list (filenames
					 containing our host database) */
 
/* job management variables */
 float ACT = BASS_ACT_GUESS;      /* average connection time (seconds) */
 int   ACT_items = 0;		      /* average items (initial guess value) */
 long  sleep_interval = 0;	      /* calculated sleep interval
					 (higher=>slower) */
 float JPM_ideal, JPM_real;      /* jobs per minute. JPM_ideal is
                                    the ideal value we would like to
                                    reach. JPM_real represents our real 
                                    measurments. (JPM_ideal updated
                                    hourly, JPM_real calculated every 
                                    minute) */ 

 /* time parsers */
 time_t time_last_review;	 /* time of last schedule review */ 
 int tm_minute = -1;             /* minute (0..59) */

 struct job_control jobcontrol;  /* job control interface structure */

 job_init(&jobcontrol, options->coward_mode == ON ? J_COWARDNESS : 0);

 recover_skip = options->recover_point;
 JPM_ideal = options->jpm;

 log("schedule: started.");
 for(list_link = options->host_lists; list_link; list_link = list_link->next)  
   {
     fp = fopen((char *)list_link->object, "r");
     if(!fp)
       {
	 log("schedule: unable to open hostlist file <%s> for reading",
	     (char *)list_link->object);
	 continue;
       }

     for(count_hostlist = 0; fgets(host, sizeof(host), fp); count_hostlist++)
       {
	 count_total++;
	 if(recover_skip)
	   {
	     recover_skip--;
	     continue;
	   }

	 /* chop off trailing newline */
	 host[strlen(host)-1] = '\0';

	 if(time_get_minute() != tm_minute)
	   {
	     /* don't recalculate ACT if we haven't done any jobs to base our
		calculations on. (haven't yet assigned any job slots) */
	     if(job_slots(&jobcontrol))
	       {
		 /* update our recover position (in case we crash and burn) */
		 recover_update(options, count_total);

		 /* calculate ACT [average connection time]. A correct
		    stable ACT is essential when we want to calculate the most
		    accurate values of job_slots and possibly sleep_interval,
		    and thus obtain control over our schedule */

		 JPM_real = 60*
		            (float)job_counter(&jobcontrol)/
		            ((int)(time_now()-time_last_review));

		 ACT = (float)
		       (ACT*ACT_items+60*job_slots(&jobcontrol)/JPM_real - 
		       ((float)sleep_interval/1000000))/((int)(ACT_items+1));

		 if(ACT_items < BASS_ACT_MAX_ITEMS) ACT_items++;
	       }

	     if(JPM_ideal < (float)60/ACT)
	       {
		 job_assign_slots(&jobcontrol, 1);
		 sleep_interval = (((float)60/JPM_ideal - ACT))*1000000;
	       }
	     else
	       {
		 job_assign_slots(&jobcontrol, (int)JPM_ideal*(float)ACT/60);
		 sleep_interval = 0;
	       }

	     time_last_review = time_now();
	     tm_minute = time_get_minute();
	     job_counter_reset(&jobcontrol);
	   }

	 /* job fork does all the work, we just call it and expect it to
	    behave like a normal fork syscall. */
	 switch(job_fork(&jobcontrol))
	   {
	   case JOB_CHILD :
	     handlehost(host, options->generic_timer, options->verbose_mode);

	     usleep(sleep_interval);
	     exit(0);

	   case JOB_PARENT :
	     /* there's nothing to do right now, but I'm keeping
		the switch case here, "in the name of all that is good in
		c programming style"... */
	     break;

	   case JOB_RESTART :
	     log("recovered from a coward fit (about %d minutes long).",
		 (time_now()-time_last_review)/60);

	     tm_minute = -1;
	     break;

	   default :
	     log("unknown job_fork return code!");
	     sleep(1);
	   }
       }

     fclose(fp);

     if(!recover_skip)
      log("schedule: finished scanning %ld hostlist file <%s> hosts",
	  count_hostlist, (char *)list_link->object);
   }

 log("schedule: done scanning, %ld hosts scanned total", count_total);

 /* end crash and burn recovery system */
 recover_free();

}

/* free the recovery mechanism of it's job, nothing more to recover from */
void recover_free(void)
{
 unlink(G_recovery_file);
}

/* update recovery mechanism (saving our position in case we crash and burn) */
void recover_update(Options *options, unsigned long count_total)
{
  FILE *fp;
  struct list *list_link;
  
  fp = fopen(G_recovery_file, "w");
  if(!fp)
    {
      log("recover_update: unable to write to recovery file, <%s>:%s",
	  G_recovery_file, strerror(errno));
      return;
    }

  fprintf(fp, "%ld:%f:%d:%d:%d:%s\n",
	      count_total,
	      options->jpm,
              options->generic_timer,
	      options->coward_mode,
	      options->verbose_mode,
	      options->log_file);  

  for(list_link = options->host_lists; list_link; list_link=list_link->next)
    fprintf(fp, "%s\n", (char *)list_link->object);

  fclose(fp);
}

/* have we crash and burned? 
   presence of BASS_RECOVERY_FILE noted.
   return:
   * true on success (recovering, received state), 
   * false otherwise (including: there is nothing to recover from.

   Note we read our state from our recovery file (our progress so far,
   our different arguments) */
int recover_init(Options *options)
{
  FILE *fp;
  char linefeed[256];
  
  if(!(fp = fopen(G_recovery_file, "r")) ||
     !fgets(linefeed, sizeof(linefeed), fp))
    {
      if(fp) fclose(fp);
      return 0;
    }

  options->log_file = (char *) xmalloc(sizeof(linefeed));
  if(sscanf(linefeed, "%ld:%f:%d:%d:%d:%s",
	               &options->recover_point,
	               &options->jpm,
	               &options->generic_timer,
	               &options->coward_mode,
	               &options->verbose_mode,
	               options->log_file) != 6)
    {
      fclose(fp);
      return 0;
    }

  while(fgets(linefeed, sizeof(linefeed), fp))
    {
      linefeed[strlen(linefeed)-1] = '\0';
      list_add(&options->host_lists, linefeed, strlen(linefeed)+1);
    }

  fclose(fp);
  return 1;
}

/* FMTYWTK about executing in background */
#include <fcntl.h>
#include <sys/ioctl.h>

void go_background(void)
{
 int fd;
 if(fork()) exit(0);

 /* open our tty and disable it as our controlling tty */
 fd = open("/dev/tty", O_RDWR|O_NOCTTY);
 if (fd >= 0) {
  (void)ioctl(fd, TIOCNOTTY, NULL);
  close(fd);
 }

 /* declare ourselves leader */
 setsid();
 chdir("/");

 signal(SIGHUP, SIG_IGN);
 signal(SIGINT, SIG_IGN);
}

/* handle the scan */
void handlehost(char *host, int generic_timer, int verbose_mode)
{
  int i;
  struct sockaddr_in hostaddr;

  if(network_resolve(host, 0, &hostaddr) < 0)
    {
      if(verbose_mode) 
	log("[%s] Unable to resolve hostname\n", host);
      return;
    }

  if(!network_reachable(&hostaddr, generic_timer))
    {
      if(verbose_mode)
	log("[%s] Address is unreachable\n", host);
      return;
    }

  for(i = 0; cgi_hooks[i].cgi_alias; i++)
    if((cgi_hooks[i].cgi_function)(&hostaddr, host, generic_timer) < 0) 
      {
	switch(errno) 
	  {
	  case ENETUNREACH	:
	  case ETIMEDOUT	:
	  case ECONNRESET	:
	  case ECONNREFUSED	:
	  case EHOSTDOWN	:
	    if(verbose_mode)
	      log("[%s] NO web services available\n", host);
	    goto no_more_cgi;			 
	  }
	
	if(verbose_mode)
	  web_logerror(errno, host, i);
      } 

 no_more_cgi:

  for(i = 0; scan_hooks[i].scan_alias; i++) 
    if((scan_hooks[i].scan_function)
       (&hostaddr, host, generic_timer) < 0)
      if(verbose_mode) logerror(errno, host, i);

  rpc_handlehost(&hostaddr, host, generic_timer, verbose_mode);

  return;
}

/* handle cgi error codes (imported from bass1) */
void web_logerror(int error, char *host, int i)
{
  switch(errno)
    {
    case ENOMEM	: 
      log("%s - [%s] OUT OF MEMORY?!?!?!.",
	  cgi_hooks[i].cgi_alias, host);
      break;
    case EBADRQC	: 
      log("%s - [%s] cgi not installed.",
	  cgi_hooks[i].cgi_alias, host);
      break;
    case -1	: 
      log("%s - [%s] unknown cgi failure.",
	  cgi_hooks[i].cgi_alias, host);
      break;
    }
}

/* handle scan hook errors (routine imported from bass1) */
void logerror(int error, char *host, int i)
{
  switch(errno) 
    {
    case EHOSTDOWN    :
    case ENETUNREACH  :
    case EHOSTUNREACH :
      log("%s - [%s] no route to host, unreachable", 
	  scan_hooks[i].scan_alias, host);
      break;

    case ETIMEDOUT    :
      log("%s - [%s] Connection timed out", 
	  scan_hooks[i].scan_alias, host);
      break;

    case ECONNRESET   :
    case EPIPE	    :
      log("%s - [%s] Connection closed prematurely",
	  scan_hooks[i].scan_alias, host);
      break;
	
    case ECONNREFUSED :
      log("%s - [%s] Connection refused by foriegn host",
	  scan_hooks[i].scan_alias, host);
      break;

    case EBADRQC      :
      log("%s - [%s] Host denied Iquery request", 
	  scan_hooks[i].scan_alias, host);
      break;

    case EPROTO	    :
      log("%s - [%s] server type mismatch",
	  scan_hooks[i].scan_alias, host);
      break;

    default           :
      log("%s- [%s] unregistered error, %s",
	  scan_hooks[i].scan_alias, host, 
	  strerror(error));
    }
}

