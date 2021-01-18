/*

job.c

Author: Liraz Siri <liraz@bigfoot.com>

Copyright (c) 1998 Liraz Siri <liraz@bigfoot.com>, Ariel, Israel,
	      All rights reserved.

Created: Tue Nov 10 03:54:09 IST 1998

Code for managing job control, manipulating processes, etc.

*/

#include <sys/types.h>
#include <sys/wait.h>
#include <unistd.h>
#include <signal.h>
#include "coward.h"
#include "log.h"
#include "job.h"
#include "xmalloc.h"
#include "timeaux.h"

/* initialize the job control mechanism (allocate memory/initial values) */
void job_init(struct job_control *jobcontrol, int options)
{
 int i;
 jobcontrol->alloc = 64;
 jobcontrol->slots = 0;
 jobcontrol->counter = 0;
 jobcontrol->options = options;
 jobcontrol->pids = (int *) xmalloc(jobcontrol->alloc * sizeof(int));

 for(i = 0; i<jobcontrol->alloc; i++)
  jobcontrol->pids[i] = JOB_FREE_SLOT;
}

/* assign a new restricted amount of job slots */
void job_assign_slots(struct job_control *jobcontrol, int slots)
{
 int i;

 /* resize code */
 if(slots > jobcontrol->alloc)
 {
  jobcontrol->alloc += slots + 64;
  jobcontrol->pids = (int *) xrealloc(jobcontrol->pids, 
				      jobcontrol->alloc * sizeof(int));
  for(i = jobcontrol->alloc-slots-64; i<jobcontrol->alloc+slots+64; i++)
   jobcontrol->pids[i] = JOB_FREE_SLOT;
 } 

 jobcontrol->slots = slots;
}

/* return the number of assigned job slots */
int job_slots(struct job_control *jobcontrol)
{
 return jobcontrol->slots;
}

/* Manage job control.
   restrictions: job_assign_slots must have been called (at least
                 once) before to assign the number of job slots available.
   Returned:
    JOB_CHILD - the child;
    JOB_PARENT - the parent;
    JOB_RESTART - job tasking restarted (coward antisocialism probably
                  kicked in).
    (-1) - fork error.
*/    
int job_fork(struct job_control *jobcontrol)
{
 int i, child_pid, child_status;

 for(;;)
 {
   /* if we've kicked into a coward antisocial spasm, we may have escaped
      job_cowardness several minutes later, maybe even several hours, the jobs
      we've carried out cannot be used to estimate our progress (the result
      would be alarmingly large overflow of job_slots (to compensate for the
      loss) */
  if(jobcontrol->options & J_COWARDNESS && 
     job_cowardness(jobcontrol))
    {
      job_assign_slots(jobcontrol, 0);
      return JOB_RESTART;
    }

  /* the scope of our checks is not limited to jobcontrol->slots so that
     if our job slots shrink we will still free children beyond 
     jobcontrol->slots */

  for(i = 0; i<jobcontrol->alloc; i++)
   if(jobcontrol->pids[i] != JOB_FREE_SLOT &&
      waitpid(jobcontrol->pids[i], &child_status, WNOHANG)==jobcontrol->pids[i])
   {
    jobcontrol->pids[i] = JOB_FREE_SLOT;
    jobcontrol->counter++;	/* task finished, counter incremented */
   }

  if(!jobcontrol->slots)
   return JOB_ERROR_NOSLOTS;
 
  for(i = 0; i<jobcontrol->slots; i++)
   if(jobcontrol->pids[i] == JOB_FREE_SLOT)
   {
    fork_retry:
    switch(child_pid = fork())
    {
     case  0 :
         return JOB_CHILD;
     case -1 :
         sleep(10); 
 	 log("unable to fork, retrying again in 10 seconds.");
         goto fork_retry;
     default :
         jobcontrol->pids[i] = child_pid;
         return JOB_PARENT; 
    }
   }
  usleep(JOB_USLEEP);
 } 
 /* NOT REACHED */
}


/* return the counter value */
int job_counter(struct job_control *jobcontrol)
{
 return jobcontrol->counter;
}

/* reset the counter value to zero */ 
void job_counter_reset(struct job_control *jobcontrol)
{
 jobcontrol->counter = 0;
}

/* emergency shutdown of all processes */
void job_shutdown(struct job_control *jobcontrol)
{
 int i, child_status;

 /* terminate our processes by being very rude and sending them a SIGKILL */
 for(i = 0; i < jobcontrol->alloc; i++)
  if(jobcontrol->pids[i] != JOB_FREE_SLOT)
   kill(jobcontrol->pids[i], SIGKILL);

rinse_lather_repeat:

 for(i = 0; i < jobcontrol->alloc; i++)
  if(jobcontrol->pids[i] != JOB_FREE_SLOT && 
     waitpid(jobcontrol->pids[i], &child_status, WNOHANG)==jobcontrol->pids[i])
  jobcontrol->pids[i] = JOB_FREE_SLOT;

 /* make sure all of our children have been released */
 for(i = 0; i < jobcontrol->alloc; i++)
  if(jobcontrol->pids[i] != JOB_FREE_SLOT) 
   goto rinse_lather_repeat;
}

/* coward checks for system activity (return true if cowardness kicked in,
   false otherwise) */
int job_cowardness(struct job_control *jobcontrol)
{
 static time_t time_last_review = -1;

 /* time wrapper to make sure we don't activate cowardness probes every tenth
    of a second */
 if(time_now() - time_last_review >= JOB_COWARDNESS_FREQUENCY)
 {
  if(!coward_coastclear())
  {
   job_shutdown(jobcontrol);

   do sleep(COWARDNESS_COASTCLEAR_SECS/2);
   while(!coward_coastclear());

   time_last_review = time_now();
   return 1;
  }
  time_last_review = time_now();
 }

 return 0;
}

