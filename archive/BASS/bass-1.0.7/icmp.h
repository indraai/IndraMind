/*

icmp.h

Author: Liraz Siri <liraz@bigfoot.com>

Copyright (c) 1998 Liraz Siri <liraz@bigfoot.com>, Ariel, Israel
                   All rights reserved

Created: Fri Sep 11 19:46:44 GMT 1998

Handle simple icmp functions. send and recieve. 

*/

#include <netinet/ip_icmp.h>
#include <netinet/ip.h>

#define LOCAL_ICMP
#ifndef LOCAL_ICMP
#define icmp_type type
#define icmp_code code
#define icmp_cksum checksum
#define icmp_id un.echo.id
#define icmp_seq un.echo.sequence
#endif

#define ip_hl ihl
#define ip_v version
#define ip_tos tos
#define ip_len tot_len
#define ip_id id
#define ip_off frag_off
#define ip_ttl ttl
#define ip_p protocol
#define ip_sum check
#define ip_src saddr
#define ip_dst daddr

#ifndef LOCAL_ICMP
#define icmp_echo	icmphdr
#endif

#define PKTSIZE		64
#define ICMP_ID		6666

/*
 *  ICMP_ECHO / ICMP_ECHOREPLY header prototype
 */

#ifdef LOCAL_ICMP
#undef icmp_type
#undef icmp_code
#undef icmp_cksum
#undef icmp_id
#undef icmp_seq

struct icmp_echo
{
    u_char  icmp_type;          /* 1 byte type              */
    u_char  icmp_code;          /* 1 byte code              */
    u_short icmp_cksum;         /* 2 byte checksum          */
    u_short icmp_id;            /* 2 byte identification    */
    u_short icmp_seq;           /* 2 byte sequence number   */
};
#endif

/* Send an echo icmp request to `addr' */
int icmp_send_echo(struct sockaddr_in *addr);

/* Wait for an echo reply from `addr' */
int icmp_wait_reply(struct sockaddr_in *addr);

/* Just calculate the icmp checksum */
static int icmp_in_cksum(u_short *addr, int len);
