#ifndef SEEN_RPC_H
#define SEEN_RPC_H
/*

rpc.h

Author: Liraz Siri <liraz@bigfoot.com>

Copyright (c) Liraz Siri <liraz@bigfoot.com>, Ariel, Israel
	      All rights reserved.

Created: Thu Oct  8 05:20:26 GMT 1998

Distribution of RPC scan hooks through centralized management code.

*/

#include <rpc/rpc.h>
#include <rpc/pmap_prot.h>
#include <rpc/pmap_clnt.h>
#include <sys/timeb.h>

#define PORTMAP_PORT	111

#define PORTMAP_RPC	100000
#define TOOLTALK_RPC	100083
#define MOUNTD_RPC	100005

#define TOOLTALK_VERS	1
#define MOUNTD_VERS	1

#define BUF_OVERFLOW_LEN	2048
#define TOOLTALK_OVERFLOW_LEN	1128
#define MOUNTD_OVERFLOW_LEN	1024

#define PMAPDUMP_TIMEOUT	15

#define MOUNTPROC_MNT ((u_long)1)

struct tt_reply {
  int i1;
  int i2;
};

/*-- bass's central rpc interface. rpc_handlehost requests a portmap
     dump of the rpc services available, attempts to look up any matching
     hooks for the services found and calls them. --*/
void rpc_handlehost(struct sockaddr_in *addr, char *host, int timer,
		    int verbose_mode);

/* Log an rpc error */
void rpc_logerror(int err, char *host, int hook_slot);

/*-- Modest timer wrappers for standard rpc functions --*/
CLIENT *tclnttcp_create(struct sockaddr_in *raddr, unsigned long prog,
			unsigned long vers, int *sockp, unsigned int sendsz, 
		        unsigned int recvsz, int timer);

/*-- Look up the apropriate 'hook' function slot. --*/
int rpc_hook_lookup(unsigned long rpc_number);

/*-- RPC handlehost hooks --*/
int rpc_tooltalk_handlehost(struct sockaddr_in *addr, char *host, int timer);
int rpc_mountd_handlehost(struct sockaddr_in *addr, char *host, int timer);
#endif
