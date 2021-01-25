/*

qpopper.h

Author: Liraz Siri <liraz@bigfoot.com>

Copyright (c) 1998 Liraz Siri <liraz@bigfoot.com>, Ariel, Israel
                   All rights reserved

Created: Sat Sep 12 05:28:48 GMT 1998

Code to test for the qpopper vulnerability, this basicly just checks
the version.

*/

#define QPOPPORT	110
#define QBUFSIZ		256
#define QMSGTIMEOUT	10

#define QMINHDRLEN	30
#define QPOP_OVERFLOW_LEN	4095

#define QPOP_IMMUNE_VERSION	"2.5"
#define S_VERSION		"ersion "
 
/* not much more that needs to be explained, read the header description */
int qpopper_handlehost(struct sockaddr_in *addr, char *host, int timer);


