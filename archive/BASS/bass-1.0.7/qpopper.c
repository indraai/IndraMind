/*

qpopper.c

Author: Liraz Siri <liraz@bigfoot.com>

Copyright (c) 1998 Liraz Siri <liraz@bigfoot.com>, Ariel, Israel
                   All rights reserved

Created: Sat Sep 12 05:35:48 GMT 1998
Updated: Sat Sep 26 09:17:42 GMT 1998. We bufferoverflow the server now
				       and evaluate it's response,
				       as well as just reviewing the
				       header.

Code to test for the qpopper vulnerability, this basicly just checks
the version.

*/

#include "BASS.h"
#include "qpopper.h"
#include "network.h"
#include "log.h"

/* not much more that needs to be explained, read the header description */
int qpopper_handlehost(struct sockaddr_in *addr, char *host, int timer)
{
 int tcpfd, n, qpop_overflow;
 struct sockaddr_in raddr;

 char *version;
 char *serverid, *serverid_ptr, *buff;

 memcpy(&raddr, addr, sizeof(struct sockaddr_in));
 raddr.sin_port = htons(QPOPPORT);

 if((tcpfd = socket(AF_INET, SOCK_STREAM, IPPROTO_TCP)) < 0 ||
    (tconnect(tcpfd, (struct sockaddr *)&raddr, sizeof(struct sockaddr),
              timer)) < 0) return -1;
 
 serverid = (char *) alloca(QBUFSIZ);
 if((n = network_gets(tcpfd, serverid, QBUFSIZ, 10)) < QMINHDRLEN) return -1;

 if( !strstr(serverid, "QPOP") && !strstr(serverid, "QUALCOMM") ) {
  close(tcpfd);
  errno = EPROTO; return -1;
 } else {
    if((version = strstr(serverid, S_VERSION))) 
    {
     version += strlen(S_VERSION);
     if((serverid_ptr = strchr(version, (int)')'))) *serverid_ptr = '\0';
    }

    /*-- brief preparation of an adequate buffer --*/
    buff = (char *) alloca(QPOP_OVERFLOW_LEN + 10 + 1);
    memset(buff, 'A', QPOP_OVERFLOW_LEN);
    strcpy(buff + QPOP_OVERFLOW_LEN, "\r\nQUIT\n");

    network_twrite(tcpfd, buff, strlen(buff), timer);
    buff[0] = '\0';
    if(network_gets(tcpfd, buff, 1024, timer) < 0) 
     goto evaluate_vulnerability; /* ERROR for the exagerated string */
    network_gets(tcpfd, buff, 1024, timer); /* +OK for the QUIT */
   }

evaluate_vulnerability:
 close(tcpfd);

 /*-- UGLY. Is there any conceivable of making this look GOOD? --*/
 qpop_overflow = !strlen(buff);

 if(qpop_overflow) 
  log("qpopper - [%s] vulnerable (bufferoverflowed) version (%s).",
            network_getname(host), version ? version:"UNKNOWN");  
 else
 if(version && strlen(version) && (atof(version) < atof(QPOP_IMMUNE_VERSION)) ) 
  log("qpopper - [%s] SHOULD be vulnerable. no overflow. version (%s).",
             network_getname(host), version); 
 else 
  log("qpopper - [%s] definately immune server. version (%s).",
	    host, version?version:"UNKNOWN");

 return 0;
}

