#ifndef SEEN_READCONF_H
#define SEEN_READCONF_H
/*

readconf.h

Author: Liraz Siri <liraz@bigfoot.com>

Copyright (c) 1998 Liraz Siri <liraz@bigfoot.com>, Ariel, Israel,
              All rights reserved.

Created: Wed Dec  2 15:34:29 IST 1998

configuration structures and routines.

*/

typedef struct {
  char *log_file;                 /* results log file (ussually usefull 
				     information) */

  float jpm;                      /* jobs per minute, use in our scheduling
				     system */
  int generic_timer;              /* generic timer, used seperately in
				     different blocking routines we wrap */
  int coward_mode;              /* exhibit coward socail phobias (play
				     dead when anyone is around) */
  int verbose_mode;               /* log boring, useless information,
				     (errors, dead hosts, timeouts, etc). */

  long recover_point;             /* the number of hosts we've managed to
				     scan so far (strictly recovery system)*/
  struct list *host_lists;        /* host lists */
} Options;


/* initialize default option values */
void readconf_default(Options *options);
#endif
