/*

network.h

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

#include <setjmp.h>

jmp_buf jmpbuf;

/* tonights specials... */

/* tconnect, wrapped connect with a timer */
int tconnect(int sockfd, struct sockaddr *serv_addr, int addrlen, int timeout);

/* writes to a socket as much as it can within the timeout, returns number
   of bytes sent or -1 if anything really annoying happens it can't
   block and wait out. assume sockfd is blocking */

int network_twrite(int sockfd, void *buf, int buf_size, int timer);

/* resolve hostname, ip, and fill in the sockaddr structure.
   we check if 'hostname' is an ip first. if we fail, we try to resolve
   Hostname using gethostbyname. we fill in 'addr'-> sin_addr
   with the matching network address number, sin_port with 'port' and
   set sin_family to AF_INET */

int network_resolve(char *Hostname, int port, struct sockaddr_in *addr);

/* network_getname does a reverse resolution of 'host', if 'host' is an ip
   address, and returns back 'host' if it is not an ip address.
   note that we can call network_getname to really resolve 'host' only
   once, as any consecutive calls will return the resolved address. this
   is an optimization to speed things up a bit */

char *network_getname(char *host);

/* Here we send addr up to MAXPACKETS icmp echo requests, and return
   1 on response. we call icmp_send_echo to send, and wrap icmp_wait_reply
   with a timer, as it blocks execution until a valid respose is recieved */

int network_reachable(struct sockaddr_in *addr, int timer);

/* Get a newline terminated string from fd, of maximum size bytes,
   wrapped with a timer of course. we return -1 on error, and the number
   of characters we recieved [_not_ including null characters which we
   ignore] on success, or timeout. network_gets assumed fd is blocking */

int network_gets(int fd, char *buf, int size, int timer);

/* alarm wrapper that preforms signal operations, assign SIGALRM to
   flashback, to be used with setjmp */

int arm(int seconds);

/* return to the point of execution that was saved using setjmp, prior
   to the alarm setting off */

void flashback(int ignore);
