/*

log.h

Author: Liraz Siri <liraz@bigfoot.com>

Copyright (c) 1998 Liraz Siri <liraz@bigfoot.com>, Ariel, Israel,
              All rights reserved.

Created: Sun Nov  8 19:13:23 IST 1998

standard log interface.

*/

#include <stdarg.h>

/* initialize log interface. log_init may be called more then once,
   redirecting the log output from one log file to another. 
   On error we return -1 (unable to open logfile for writing), on
   success we return 0 */
int log_init(const char *progname, const char *logfile);

/* format error message, outputed to stderr */
void error(const char *format, ...);

/* format fatal error message, output to stderr, and exit */
void fatal(const char *format, ...);

/* format a log message, (including log time and progname), output to
   log_fp. */
void log(const char *format, ...);

/* manipulate ctime static return a bit. (trunctuated from the beginning
   and the end), returning a staticly allocated (local) string. (shortened
   version of returned ctime). This is a 'private' decleration, there
   should be no reason anyone should call this from here. */
char *cctime(void);




