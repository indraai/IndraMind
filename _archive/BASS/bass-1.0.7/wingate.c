/*

wingate.c

Author: Liraz Siri <liraz@bigfoot.com>

Copyright (c) 1998 Liraz Siri <liraz@bigfoot.com>, Ariel, Israel
                   All rights reserved

Created: Created: Mon Nov  2 02:51:02 IST 1998

This is a moronic wingate 'detector' wooooo. I can't believe I'm actually
writing this.

*/

#include "BASS.h"
#include "network.h"
#include "wingate.h"
#include "log.h"

int wingate_handlehost(struct sockaddr_in *addr, char *host, int timer)
{
 int sockfd;
 int i, n, bytes;

 struct sockaddr_in raddr;
 u_char response[MAX_RESPONSE_SIZE];

 memset(response, 0, sizeof(response));
 memcpy(&raddr, addr, sizeof(raddr));
 raddr.sin_port = htons(23);

 if((sockfd = socket(AF_INET, SOCK_STREAM, IPPROTO_TCP)) < 0 ||
     tconnect(sockfd, (struct sockaddr *)&raddr, sizeof(struct sockaddr),
	     timer) < 0) goto fail;

 for(bytes = 0; bytes<MAX_RESPONSE_SIZE; bytes+=n) 
 {
  arm(timer);
  if(!setjmp(jmpbuf)) 
  {
   if((n = read(sockfd, response + bytes, MAX_RESPONSE_SIZE - bytes)) <= 0)
   { errno = EPROTO; goto fail; }
   alarm(0);

   for(i = 0; i<n; i++) 
   {
    /* Detect telnet negotiation which is obviously NOT wingate */
    if(response[bytes+i] == 255 && n - i >= 3) 
    {
     u_char negotiate[4]; 
     unsigned char *cp = (unsigned char *)&response[bytes+i+1];
     negotiate[0] = 255;
     negotiate[1] = (*cp == 251 || *cp == 252)? 254: 
		    (*cp == 253 || *cp == 254)? 252:0;
     negotiate[2] = *(++cp);
     if(negotiate[1])
     {
      write(sockfd, negotiate, 3);
      i+=2;
     }
    }
    response[bytes+i] = (char)tolower((int)response[bytes+i]);
   }

   fflush(stdout);
   
   if( strstr(response, "gate>") != NULL )  
   {
    log("wingate - [%s] wingate ready and available", 
        network_getname(host));
    close(sockfd);
    return 0; 
   }

  } else 
    { 
     errno = ETIMEDOUT; 
     goto fail; 
    }
 }

fail:
 close(sockfd);
 return -1;
}
