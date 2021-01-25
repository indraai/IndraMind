/*

uname.h

Author: Liraz Siri <liraz@bigfoot.com>

Copyright (c) 1998 Liraz Siri <liraz@bigfoot.com>, Ariel, Israel
                   All rights reserved

Created: Sat Sep 26 01:17:02 GMT 1998

Code for the indentification of a successfull run of uname.

*/

#define SIG_SUNOS	"SunOS"
#define SIG_LINUX	"Linux"
#define SIG_AIX		"AIX"
#define SIG_OSF		"OSF1"
#define SIG_HPUX	"HP-UX"
#define SIG_IRIX	"IRIX"
#define SIG_FREEBSD	"FreeBSD"
#define SIG_UNICOS	"UNICOS"

#define OS_SUNOS	0
#define OS_LINUX	1
#define OS_AIX		2
#define OS_OSF		3
#define OS_HPUX		4
#define OS_IRIX		5
#define OS_FREEBSD	6
#define OS_UNICOS	7


/* Returns the os identification number if 'output' contains any OS
   identification substrings. Otherwise returns -1. */
int uname_ident(char *output);
