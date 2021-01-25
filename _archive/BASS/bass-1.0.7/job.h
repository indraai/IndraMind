/*

job.h

Author: Liraz Siri <liraz@bigfoot.com>

Copyright (c) 1998 Liraz Siri <liraz@bigfoot.com>, Ariel, Israel,
	      All rights reserved.

Created: Tue Nov 10 03:54:09 IST 1998

Code for managing job control, manipulating processes, etc.

*/

struct job_control {
 int options;				/* job control options */
 int alloc;				/* allocated cells in the pids array */
 int slots;				/* maximum number of job slots */
 int counter;				/* jobs finished (processes freed) */
 int *pids;				/* pids array */
};

#define	JOB_FREE_SLOT	-1		/* free_slot representitive macro */ 
#define JOB_USLEEP			100000


/* initialize the job control mechanism (allocate memory/initial values) */

/* job_control->options */
#define J_COWARDNESS		0x001	/* cowardness ! - gaurd processes,
					   watching for system activity,
					   and immediately shutting down
					   until we have a clear system */ 

#define JOB_COWARDNESS_FREQUENCY	3 	/* minimum number of seconds
					   between cowardness checkups */

void job_init(struct job_control *jobcontrol, int options);

/* assign a new restricted amount of job slots */
void job_assign_slots(struct job_control *jobcontrol, int slots);

/* return the number of assigned job slots */
int job_slots(struct job_control *jobcontrol);

/* Manage job control.
   restrictions: job_assign_slots must have been called (at least
                 once) before to assign the number of job slots available.
   Returned:
    JOB_CHILD - the child;
    JOB_PARENT - the parent;
    JOB_RESTART - restarted tasking (probably because coward antisocialism
                  kicked in).
    (-1) - fork error.
*/    
        
#define JOB_CHILD	0
#define JOB_PARENT	1
#define JOB_RESTART     2

/* error codes */
#define JOB_ERROR_NOSLOTS -1    /* there we no slots! we would have waited
				   forever for a slot to open up! */
         
int job_fork(struct job_control *jobcontrol);

/* return the counter value */
int job_counter(struct job_control *jobcontrol);

/* reset counter value to zero */
void job_counter_reset(struct job_control *jobcontrol);

/* emergency shutdown of all processes */
void job_shutdown(struct job_control *jobcontrol);

/* coward checks for system activity (return true if cowardness kicked in,
   false otherwise) */
int job_cowardness(struct job_control *jobcontrol);


