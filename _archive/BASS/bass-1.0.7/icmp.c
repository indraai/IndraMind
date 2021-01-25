/*
icmp.c

Author: Liraz Siri <liraz@bigfoot.com>

Copyright (c) 1998 Liraz Siri <liraz@bigfoot.com>, Ariel, Israel
                   All rights reserved

Created: Fri Sep 11 21:09:53 GMT 1998
Updated: Mon Sep 14 19:57:24 GMT 1998 - fixed localhost socket bug,
				 	optimized icmp_wait_reply code.

Handle icmp send/recieve functions. This is basicly an easy to use
interface through which it is simple to determine wether an address
is responding to icmp requests.

*/

#include "BASS.h"
#include "icmp.h"

int sequence = 0;
int icmpfd = -1;

#define MAXPACKET	4096

/* Sends an ICMP echo request, PKTSIZE long to addr. This functions open
   the global icmp socket that will remain open until a valid ICMP reply
   is recieved. returns -1 on error, 0 on success */

int icmp_send_echo(struct sockaddr_in *addr)
{
 int hold;

 char packet[PKTSIZE];
 struct icmp_echo *icmp_hdr;
 struct sockaddr_in raddr;
 struct protoent *protocol;

 memcpy(&raddr, addr, sizeof(struct sockaddr_in)); 
 memset(packet, 0, sizeof(packet));

 icmp_hdr = (struct icmp_echo *) packet;

 icmp_hdr->icmp_type = ICMP_ECHO;
 icmp_hdr->icmp_code = 130;
 icmp_hdr->icmp_id = ICMP_ID & 0xFFFF;
 icmp_hdr->icmp_seq = sequence++;
 icmp_hdr->icmp_cksum = 0;
 icmp_hdr->icmp_cksum = icmp_in_cksum((u_short *)icmp_hdr, PKTSIZE);

 raddr.sin_port = 0;
 
 if( icmpfd < 0 && (!(protocol = getprotobyname("icmp")) ||
     (icmpfd = socket(AF_INET, SOCK_RAW, protocol->p_proto)) < 0)) 
  return -1;

 hold = 1;
 setsockopt(icmpfd, SOL_SOCKET, SO_BROADCAST, (char *)&hold, sizeof(hold));

 if(sendto(icmpfd, packet, PKTSIZE, 0, (struct sockaddr *)&raddr,
  	sizeof(struct sockaddr)) < 0) return -1; 

 return 0;
}

/* icmp_wait_reply blocks until a valid icmp_echo reply is recieved
   from addr, with an id of ICMPID & 0xFFFF. The functions opens the
   global icmpfd socket if the socket has not been previously opened.
   We return -1 on error, or the size of the icmp packet recieved on
   success */

int icmp_wait_reply(struct sockaddr_in *addr)
{
 int recieved, fromlen;
 
 char packet[MAXPACKET];

 struct sockaddr_in raddr;
 struct icmp_echo *icmp_hdr;
 struct iphdr	*ip_hdr;
 struct protoent *protocol;

 if( icmpfd < 0 && ( !(protocol = getprotobyname("icmp")) ||
     (icmpfd = socket(AF_INET, SOCK_RAW, protocol->p_proto)) < 0)) 
  return -1;

 for(;;) {
  fromlen = sizeof(raddr);
  if( (recieved = recvfrom(icmpfd, packet, sizeof(packet), 0, 
                          (struct sockaddr *)&raddr, &fromlen)) < 0 || 
			  recieved < sizeof(struct iphdr) + 
			             sizeof(struct icmp_echo) )  
   continue;

  ip_hdr = (struct iphdr *)packet;
  icmp_hdr = (struct icmp_echo *)(packet + (ip_hdr->ip_hl << 2));
/*  icmp_hdr = (struct icmp_echo *)(packet + 20);*/

  if(raddr.sin_addr.s_addr != addr -> sin_addr.s_addr ||
     icmp_hdr -> icmp_type != ICMP_ECHOREPLY ||
     icmp_hdr -> icmp_id != ICMP_ID & 0xFFFF) continue;
 
  close(icmpfd); icmpfd = -1;
  return fromlen; 
 }

/* NOT REACHED */
}


/*
 * in_cksum --
 *      Checksum routine for Internet Protocol family headers (C Version)
 */
static int icmp_in_cksum(u_short *addr, int len)
{
        register int nleft = len;
        register u_short *w = addr;
        register int sum = 0;
        u_short answer = 0;

        /*
         * Our algorithm is simple, using a 32 bit accumulator (sum), we add
         * sequential 16 bit words to it, and at the end, fold back all the
         * carry bits from the top 16 bits into the lower 16 bits.
         */
        while (nleft > 1)  {
                sum += *w++;
                nleft -= 2;
        }

        /* mop up an odd byte, if necessary */
        if (nleft == 1) {
                *(u_char *)(&answer) = *(u_char *)w ;
                sum += answer;
        }

        /* add back carry outs from top 16 bits to low 16 bits */
        sum = (sum >> 16) + (sum & 0xffff);     /* add hi 16 to low 16 */
        sum += (sum >> 16);                     /* add carry */
        answer = ~sum;                          /* truncate to 16 bits */
        return(answer);

}

