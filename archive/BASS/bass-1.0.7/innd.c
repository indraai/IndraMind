/*

innd.c

Author: Liraz Siri <liraz@bigfoot.com>

Copyright (c) Liraz Siri <liraz@bigfoot.com>, Ariel, Israel
	      All rights reserved.

Created: Sat Sep 26 09:17:42 GMT 1998

Code for the innd vulnerability 'hook'.

*/

#include "BASS.h"
#include "network.h"
#include "innd.h"
#include "log.h"

/* We only check the innd version. If smaller then the lowest known
   immune version, then we declare vulnerability. */
int innd_handlehost(struct sockaddr_in *addr, char *host, int timer)
{
 int tcpfd;
 char *serverid, *version;
 struct sockaddr_in raddr;

 memcpy(&raddr, addr, sizeof(raddr));
 raddr.sin_port = htons(INN_PORT);

 if((tcpfd = socket(AF_INET, SOCK_STREAM, IPPROTO_TCP)) < 0 ||
    tconnect(tcpfd, (struct sockaddr *)&raddr, sizeof(struct sockaddr),
	     timer) < 0) return -1;

 serverid = (char *)alloca(INN_ID_LEN);
 if(network_gets(tcpfd, serverid, INN_ID_LEN - 1, timer) < 0) return -1;
 close(tcpfd);

 if((version = strstr(serverid, "INN"))) {
  version += 4; *(version + 3) = 0;
  if(strlen(version) && atof(version) < atof(INN_IMMUNE_VERSION) ) 
   log("innd - [%s] vulnerable version (%s).", network_getname(host), 
						       version);
  else
   log("innd - [%s] immune version (%s).", host, version);

  return 0;
 }

 return (errno = -1);
}

