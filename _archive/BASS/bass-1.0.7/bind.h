/*

bind.h

Author: Liraz Siri <liraz@bigfoot.com>

Copyright (c) 1998 Liraz Siri <liraz@bigfoot.com>, Ariel, Israel
                   All rights reserved

Created: Thu Sep 10 16:55:47 GMT 1998

The bind module. This is based of binfo by whoever it was that wrote it.

*/

#include <arpa/nameser.h>

#define BINDPORT	53
#define BIND_IMMUNE_VERSION_4	"9.7"
#define BIND_IMMUNE_VERSION_8   "8.2"

#define BIND_MAX_VERSION_SIZE 15

/* This queries the bind version from the host and outputs it to a log
   file */
int bind_handlehost(struct sockaddr_in *addr, char *host, int timeout);

/* these functions don't deserve an explanation */
int bind_make_keypkt(char *pktbuf, char opc);
int bind_talk(int sd, char *pkt, int pktl, char opc);


