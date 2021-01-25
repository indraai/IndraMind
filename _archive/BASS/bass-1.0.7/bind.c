/*

bind.h

Author: Liraz Siri <liraz@bigfoot.com>

Copyright (c) 1998 Liraz Siri <liraz@bigfoot.com>, Ariel, Israel
                   All rights reserved

Created: Thu Sep 10 16:55:47 GMT 1998

The bind module. This is based of binfo by whoever it was that wrote it.

*/

#include "BASS.h"
#include "bind.h"
#include "network.h"
#include "log.h"

int bind_handlehost(struct sockaddr_in *addr, char *host, int timeout)
{
 int rv, Length; 
 int TargetFD;

 char *Version;
 char *Pointer;

 struct sockaddr_in raddr;
 char iquery[512], vquery[512], rname[256];
 HEADER *dnsi, *dnsv;

 memcpy(&raddr, addr, sizeof(struct sockaddr_in));
 raddr.sin_port = htons(BINDPORT);

 memset(vquery, 0, sizeof(vquery));
 memset(iquery, 0, sizeof(iquery));

 errno = 0;

socket:

 if( (TargetFD = socket(AF_INET, SOCK_DGRAM, 0)) == -1) { 
  fprintf(stderr, "Error: failed opening socket\n"); // debug
  sleep(30);

  goto socket;
 }

 if( tconnect(TargetFD, (struct sockaddr *)&raddr, 
	      sizeof(struct sockaddr_in), timeout) < 0) 
  return -1;

 arm(timeout);
 if( !setjmp(jmpbuf) ) {
  rv = bind_talk(TargetFD, iquery, sizeof(iquery), IQUERY) && 
       bind_talk(TargetFD, vquery, sizeof(vquery), QUERY);
  arm(0);
 } else { errno = ETIMEDOUT; return -1; }

 if(!rv) { 
  errno = ECONNREFUSED;
  return -1;
 }

 close(TargetFD);

 dnsi = (HEADER *) iquery;
 dnsv = (HEADER *) vquery;

 if(dnsi->rcode) {
  errno = EBADRQC;
  return -1;
 } else {
    if(dnsv->rcode) {
      log("bind - [%s] DNS server supports IQUERY (Version denied)", 
                host);
     return 0;
    } else {

/* Position the pointer in place */
       Pointer = (vquery + sizeof(HEADER));
       while(*Pointer != '\0') Pointer++;
       Pointer += 1 + (sizeof(short) * 2);
       while(*Pointer != '\0') Pointer++;
       Pointer += 1 + (sizeof(long) + (sizeof(short) * 2));
       GETSHORT(Length, Pointer);
       Pointer++;

       if(Length > BIND_MAX_VERSION_SIZE) Length = BIND_MAX_VERSION_SIZE;

       Version = (char *) malloc(Length);
       bzero((char *)Version, Length);

       memcpy(Version, Pointer, Length - 1);
       for(Pointer = Version; Pointer - Version != Length - 1; Pointer++)
        if(!isprint(*Pointer) && !isspace(*Pointer)) *Pointer = '.';

       if(strchr(Version, '\n'))
	 *strchr(Version, '\n') = 0;

       log("bind - [%s] DNS server supports IQUERY (%s)",
	         network_getname(host), Version);       

       return 0;
      }

 
   }

}

/* Source code cut and pasted from binfo.c */

/*
 * this forms a valid dns packet based on the op code given by opc.
 * only two opcodes are supported because that's all we need to support.
 * the packet ends up in pktbuf and the length of the packet is returned.
 */
int
bind_make_keypkt(pktbuf, opc)
   char *pktbuf;
   char opc;
{
   HEADER *dnsh;
   char *ptr = pktbuf;
   int pktlen = 0;

   dnsh = (HEADER *) ptr;
   /* fill out the parts of the DNS header that aren't 0 */
   dnsh->id = htons(rand() % 65535);
   dnsh->opcode = opc;
   dnsh->rd = 1;
   dnsh->ra = 1;
   /* one answer for IQUERY, one question for QUERY */
   if (opc == IQUERY)
      dnsh->ancount = htons(1);
   else if (opc == QUERY)
      dnsh->qdcount = htons(1);
   pktlen += sizeof(HEADER);
   ptr += sizeof(HEADER);

   /* we have to make a QUERY, fill out the question section */
   if (opc == QUERY)
     {
        char qstr[] = "\007version\004bind\000";
        int qlen = strlen(qstr) + 1;

        memcpy(ptr, qstr, qlen);
        ptr += qlen;
        pktlen += qlen;
        PUTSHORT(T_TXT, ptr);
        PUTSHORT(C_CHAOS, ptr);
        pktlen += sizeof(short) * 2;
     }
   /* add a resource record for the inverse query */
   else if (opc == IQUERY)
     {
        unsigned long addr = inet_addr("1.2.3.4");
        unsigned long ttl = 31337;
        unsigned short addrlen = 4;

        *(ptr++) = '\0';
        pktlen++;
        PUTSHORT(T_A, ptr);
        PUTSHORT(C_IN, ptr);
        PUTLONG(ttl, ptr);
        PUTSHORT(addrlen, ptr);
        PUTLONG(addr, ptr);
        pktlen += (sizeof(short) * 3) + (sizeof(long) * 2);
     }
   /* if we're debugging, show what we just made */
   return pktlen;
}

/*
 * write our packet from pkt, wait for a response and put it in pkt.
 * if the alarm goes off or the read fails, we print error
 * and return 0.  otherwise, our response packet is in pkt and we return
1.
 */
int bind_talk(int sd, char *pkt, int pktl, char opc)
{
   int pktlen;

   pktlen = bind_make_keypkt(pkt, opc);
   if (!write(sd, pkt, pktlen))
     {
        perror("write failed");
        close(sd);
        return 0;
     }
   pktlen = read(sd, pkt, pktl);
   if (pktlen <= 0)
     {
        if (errno == EINTR)
           errno = ETIMEDOUT;
        close(sd);
        return 0;
     }
   return 1;
}
