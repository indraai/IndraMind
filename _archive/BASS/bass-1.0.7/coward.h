/*

coward.h

Author: Liraz Siri <liraz@bigfoot.com>

Copyright (c) 1998 Liraz Siri <liraz@bigfoot.com>, Ariel, Israel,
              All rights reserved.

Created: Sun Nov 15 19:13:04 IST 1998

cowardness routines:
* system activity auditer.
* libpcloak interface.
* mask.

*/

#define COWARDNESS_DEFAULT_OPTIONS (O_CHPGRP | O_CHCOMM | O_CHPID)
#define COWARDNESS_COASTCLEAR_SECS 120

/* mask our process, activate pcloak stealth */
void coward_init(int argc, char **argv);

/* audit for terminal activity */
int coward_coastclear(void);
