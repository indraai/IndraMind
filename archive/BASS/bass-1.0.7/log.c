/*

log.c

Author: Liraz Siri <liraz@bigfoot.com>

Copyright (c) 1998 Liraz Siri <liraz@bigfoot.com>, Ariel, Israel,
	      All rights reserved.

Created: Sun Nov  8 19:13:23 IST 1998

standard log interface.

*/

#include "BASS.h"
#include "log.h"

static int		 log_initialized = 0;	/* log initialized? */
static const char	*log_progname;		/* name of program */
static FILE		*log_fp;		/* log file (FILE *) pointer */

static char G_ctime[24]; 	/* staticly allocated ctime convert string */

/* initialize log interface. */
int log_init(const char *progname, const char *logfile)
{
again:

 if(!log_initialized) 
 {
  log_progname = progname;

  if(!(log_fp = fopen(logfile, "a")))
  {
   error("unable to open %s for writing", logfile);
   return -1;
  }

  log_initialized = 1;
 }
 else
 {
  fclose(log_fp); 
  log_initialized = 0;

  goto again;
 }

 return 0; 
}

/* format error message, outputed to stderr */
void error(const char *format, ...)
{
 va_list ap;

 va_start(ap, format);

 fprintf(stderr, "error: ");
 vfprintf(stderr, format, ap);
 fprintf(stderr, "\n");

 fflush(stderr);

 va_end(ap); 
}

/* format fatal error message, output to stderr, and exit */
void fatal(const char *format, ...)
{
 va_list ap;

 va_start(ap, format);
 fprintf(stderr, "fatal: ");
 vfprintf(stderr, format, ap);
 fprintf(stderr, "\n");

 fflush(stderr);
 va_end(ap);

 exit(-1);
}

/* format a log message, (including log time and progname), output to
   log_fp. */
void log(const char *format, ...)
{
 va_list ap;

 if(!log_initialized) return;

 va_start(ap, format);

 fprintf(log_fp, "%s =%s= ", cctime(), log_progname);
 vfprintf(log_fp, format, ap);
 fprintf(log_fp, "\n");

 fflush(log_fp);
 va_end(ap); 
}

/* manipulate ctime static return a bit. (trunctuated from the beginning
   and the end), returning a staticly allocated (local) string. (shortened
   version of returned ctime). */
char *cctime(void)
{
 time_t now = time(&now);

 strncpy(G_ctime, ctime(&now), sizeof(G_ctime)); 
 memmove(G_ctime, &G_ctime[4], 15);
 G_ctime[15] = '\0';

 return G_ctime;
}
