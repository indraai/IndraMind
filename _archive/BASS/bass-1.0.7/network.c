/*

network.c

Author: Liraz Siri <liraz@bigfoot.com>

Copyright (c) 1998 Liraz Siri <liraz@bigfoot.com>, Ariel, Israel
                   All rights reserved

Created: Thu Sep 10 19:30:40 GMT 1998

Here we handle general network code:
* forward and reverse resolution of a network address.
* wrap blocking functions such as connect and write with a timer.
* gets for a blocking network socket fd.
* determine wether or not an address is responding to icmp echo requests.

*/
#include "BASS.h"
#include "network.h"
#include "icmp.h"

#define MAX_PACKETS	3
#define MAX_ECHOREPLY	2

char *ns_name = NULL;

/* Get a newline terminated string from fd, of maximum size bytes,
   wrapped with a timer of course. we return -1 on error, and the number
   of characters we recieved (_not_ including null characters which we
   ignore) on success, or timeout. network_gets assumed fd is blocking.
   please note that we ignore '\r' and '\0' just to keep network_get's
   customers sane */

int network_gets(int fd, char *buf, int size, int timer)
{
 int i;

 arm(timer);
 if(!setjmp(jmpbuf)) 

  for(i = 0; i < size - 1; i++) {

   switch( read(fd, &buf[i], 1) ) {
    case        0 : errno = ECONNRESET;

    case       -1 : arm(0);
		    buf[i] = '\0';
                    return -1;
   }

   switch(buf[i]) {
    case	'\r'	: 
    case	'\0'	: --i; 
			  break;
    case	'\n'	: buf[i+1] = '\0';
			  goto return_ok;
   }

 } 

 else errno = ETIMEDOUT;

 buf[i] = '\0';

return_ok:

 arm(0);
 return i + 1;
}

/* writes to a socket as much as it can within the timeout, returns number
   of bytes sent or -1 if anything really annoying happens it can't
   block and wait out. assume sockfd is blocking */

int network_twrite(int sockfd, void *buf, int count, int timer)
{
 int n, sent;

 arm(timer);
 if(!setjmp(jmpbuf)) {

  for(sent = 0; sent<count; sent += n) 
   if( (n = write(sockfd, buf + sent, count - sent) ) <= 0 ) return -1;

  arm(0);

 } else errno = ETIMEDOUT;

 return sent;
}

/* Here we send addr up to MAXPACKETS icmp echo requests, and return
   1 on response. we call icmp_send_echo to send, and wrap icmp_wait_reply
   with a timer, as it blocks execution until a valid respose is recieved */

int network_reachable(struct sockaddr_in *addr, int timer)
{
 int packets_sent = 0;
 int max_packets;

 max_packets = timer/MAX_ECHOREPLY <= 0 ? 1 : timer/MAX_ECHOREPLY;

try_again:

 if(icmp_send_echo(addr) < 0) return 1;

 arm(MAX_ECHOREPLY);

 if(!setjmp(jmpbuf)) {
  icmp_wait_reply(addr);
  arm(0);
  return 1;
 } else { 
    packets_sent++;
    if(packets_sent < max_packets) goto try_again;        
   }

 return 0;
}


/* tconnect, wrapped connect with a timer */
int tconnect(int sockfd, struct sockaddr *serv_addr, int addrlen, 
	     int timeout) 
{
 int rv;

 arm(timeout);

 if(!setjmp(jmpbuf)) {
  rv = connect(sockfd, serv_addr, addrlen);
  arm(0);
  return rv;
 }

  else {
   errno = ETIMEDOUT;
   return -1;
  }

}

/* resolve hostname, ip, and fill in the sockaddr structure.
   we check if 'hostname' is an ip first. if we fail, we try to resolve
   Hostname using gethostbyname. we fill in 'addr'-> sin_addr
   with the matching network address number, sin_port with 'port' and
   set sin_family to AF_INET */
 
int network_resolve(char *Hostname, int port, struct sockaddr_in *addr)
{
 struct hostent *hp;

 bzero((char *)addr, sizeof(struct sockaddr_in));

 if( (addr->sin_addr.s_addr = inet_addr(Hostname)) == -1) {
  hp = gethostbyname(Hostname);
  if(hp)
  bcopy(hp -> h_addr, (struct sockaddr *)&addr -> sin_addr, hp ->h_length);
   else return -1;
 }

 addr -> sin_port = htons(port);
 addr -> sin_family = AF_INET;

 return 0;
}

/* network_getname does a reverse resolution of 'host', if 'host' is an ip
   address, and returns back 'host' if it is not an ip address.
   note that we can call network_getname to really resolve 'host' only
   once, as any consecutive calls will return the resolved address. this
   is an optimization to grease things up a bit */ 

char *network_getname(char *host)
{
 struct hostent *hp = NULL;
 struct sockaddr_in addr;

 if(ns_name != NULL) return ns_name;

 if((addr.sin_addr.s_addr = inet_addr(host)) != -1)
  hp = gethostbyaddr((char *)&addr.sin_addr, sizeof(addr.sin_addr), AF_INET);

 if(hp)
 {
  ns_name = (char *)malloc(strlen(hp->h_name) + 20);
  sprintf(ns_name, "%s:%s", hp->h_name, host);
  return ns_name;
 }

 return host;
}

/* alarm wrapper that preforms signal operations, assign SIGALRM to
   flashback, to be used with setjmp */
int arm(int seconds)
{

 if(!seconds) {
  signal (SIGALRM, SIG_IGN);
  return alarm(0);
 } else { 
    signal(SIGALRM, flashback);
    return alarm(seconds);
   }
}

/* return to the point of execution that was saved using setjmp, prior
   to the alarm setting off */
void flashback(int ignore)
{
 signal (SIGALRM, SIG_IGN);
 alarm(0);

 longjmp(jmpbuf, 1);
}




