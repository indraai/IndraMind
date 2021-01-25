/*

readconf.c

Author: Liraz Siri <liraz@bigfoot.com>

Copyright (c) 1998 Liraz Siri <liraz@bigfoot.com>, Ariel, Israel,
              All rights reserved.

Created: Wed Dec  2 15:34:29 IST 1998

configuration structures and routines.
currently hardcoded values, should be updated to be based on a
configuration file.

*/

#include "BASS.h"
#include "readconf.h"

/* initialize default option values */
void readconf_default(Options *options)
{
  options->coward_mode = BASS_DEFAULT_COWARD_MODE;
  options->verbose_mode = BASS_DEFAULT_VERBOSE_MODE;
  options->generic_timer = BASS_DEFAULT_GENERIC_TIMER;
  options->jpm = BASS_DEFAULT_JPM;
  options->log_file = BASS_DEFAULT_LOG_FILE;
  options->recover_point = 0;
  options->host_lists = NULL;
}




