/*

innd.h

Author: Liraz Siri <liraz@bigfoot.com>

Copyright (c) Liraz Siri <liraz@bigfoot.com>, Ariel, Israel
	      All rights reserved.

Created: Sat Sep 26 09:17:42 GMT 1998

Code for the inn vulnerability 'hook'.

*/

#define INN_PORT	119
#define INN_ID_LEN	256

#define INN_IMMUNE_VERSION	"1.6"
int innd_handlehost(struct sockaddr_in *addr, char *host, int timer);
