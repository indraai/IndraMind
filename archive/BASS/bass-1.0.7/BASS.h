/*

BASS.h

Author: Liraz Siri <liraz@bigfoot.com>

Copyright (c) 1998 Liraz Siri <liraz@bigfoot.com>, Ariel, Israel,
              All rights reserved.

Created: Sat Nov 28 03:38:30 IST 1998

Next generation bass (pressbox style source code).
*/

#include "includes.h"
#include "readconf.h"

#define BASS_PROGNAME              "BASS"   /* our log progname */

#define BASS_VERSION               1
#define BASS_VERSION_MAJOR         0       /* changed every major change */
#define BASS_VERSION_MINOR         7       /* changed every minor change */

#ifndef BASS_DEFAULT_DISTDIR
#define BASS_DEFAULT_DISTDIR       "/var/lib/bass/"
#endif

#define BASS_DEFAULT_LOG_FILE      BASS_DEFAULT_DISTDIR "bass.log"
#define BASS_RECOVERY_FILE         BASS_DEFAULT_DISTDIR "bass.recover"

#define BASS_DEFAULT_GENERIC_TIMER 15      /* generic timer */
#define BASS_DEFAULT_JPM           120     /* default jobs per minute */
#define BASS_ACT_GUESS             5       /* average connection time,
                                              rough guess */
#define BASS_ACT_MAX_ITEMS         5


#define BASS_DEFAULT_COWARD_MODE ON
#define BASS_DEFAULT_VERBOSE_MODE  OFF


/* human bit definition */
#define ON  1
#define OFF 0

/* FMTYWTK about executing in background */
void go_background(void);

/* manage job tasks, using a constant JPM anchor (pressbox style) */
void do_schedule(Options *options);

/************************
 * Handlehost scan host *
 ************************/

/* handle the scan */
void handlehost(char *host, int generic_timer, int verbose_mode);

/* cgi error codes (verbose logging) */
void web_logerror(int error, char *host, int i);

/* bass hook error codes (verbose logging) */
void logerror(int error, char *host, int i);

/*******************
 * Recovery system *
 *******************/

/* have we crash and burned? 
   presence of BASS_RECOVERY_FILE noted.
   return:
   * true on success (recovering, received state), 
   * false otherwise (including: there is nothing to recover from.

   Note we read our state from our recovery file (our progress so far,
   our different arguments) */
int recover_init(Options *options);

/* update recovery mechanism (saving our position in case we crash and burn) */
void recover_update(Options *options, unsigned long count_total);

/* free the recovery mechanism of it's job, nothing more to recover from */
void recover_free(void);
