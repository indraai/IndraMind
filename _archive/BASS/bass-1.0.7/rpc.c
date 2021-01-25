/*

rpc.c

Author: Liraz Siri <liraz@bigfoot.com>

Copyright (c) Liraz Siri <liraz@bigfoot.com>, Ariel, Israel
	      All rights reserved.

Created: Thu Oct  8 05:20:26 GMT 1998

Distribution of RPC scan hooks through centralized management code.

*/

#include "BASS.h"
#include "rpc.h"

#include "rpchooks.h"
#include "network.h"
#include "log.h"
#include "nfsmount.h"

void rpc_handlehost(struct sockaddr_in *addr, char *host, int timer, 
		    int verbose_mode)
{
 CLIENT *rpc_client;
 struct pmaplist *pmap_list = NULL;
 struct rpcent *rpc_ent;
 int rpcsock;

 struct timeval tv;
 struct sockaddr_in raddr;

 rpcsock = RPC_ANYSOCK;

 tv.tv_sec = PMAPDUMP_TIMEOUT;
 tv.tv_usec = 0;

 memcpy(&raddr, addr, sizeof(raddr));
 raddr.sin_port = htons(PORTMAP_PORT);

 /*-- Create an rpc client session to our favorite portmapper --*/
 if(!(rpc_client = tclnttcp_create(&raddr, PMAPPROG, PMAPVERS, &rpcsock, 
				   0, 0, timer))) 
 {
   if(verbose_mode)
     log("[%s] No rpc services available.", host);
  return;
 }

 /*-- List all registered RFC services --*/
 if(clnt_call(rpc_client, PMAPPROC_DUMP, (xdrproc_t) xdr_void, NULL, 
              (xdrproc_t) xdr_pmaplist, (caddr_t)&pmap_list, tv) != RPC_SUCCESS) 
 {
   if(verbose_mode)
     log("[%s] Portmapper refused to list services available.", host); 
  return;
 }

 close(rpcsock);

 while(pmap_list != NULL)
 {
  int hook_slot;

  if((hook_slot = rpc_hook_lookup(pmap_list->pml_map.pm_prog)) != -1) 
   if(!rpc_hooks[hook_slot].called)
   {
    if((rpc_hooks[hook_slot].rpc_function)(&raddr, host, timer) < 0
       && verbose_mode) 
     rpc_logerror(errno, host, hook_slot);
    rpc_hooks[hook_slot].called = 1;
   }

  pmap_list = pmap_list->pml_next;
 }

 clnt_destroy(rpc_client);
}


/*-- Modest little wrapper for clnttcp_create --*/
CLIENT *tclnttcp_create(raddr, prog, vers, sockp, sendsz, recvsz, timer)

struct sockaddr_in *raddr;
u_long prog;
u_long vers;
int *sockp;
u_int sendsz;
u_int recvsz;
int timer;

{
 CLIENT *client;

 arm(timer);
 if(!setjmp(jmpbuf)) 
 {
  client = clnttcp_create(raddr, prog, vers, sockp, sendsz, recvsz);  
  arm(0);
  return client;
 } 
 else 
 {
  errno = ETIMEDOUT;
  return NULL;
 }
}

/*-- Look up the apropriate 'hook' function slot. --*/
int rpc_hook_lookup(unsigned long rpc_number)
{
 int i;
 for(i = 0; rpc_hooks[i].rpc_alias; i++)
  if(rpc_hooks[i].rpc_number == rpc_number) return i;
 return -1;
}

bool_t xdr_tt_reply(XDR *xdrs, struct tt_reply *objp) {

  if (!xdr_int(xdrs, &objp->i1))
    return (FALSE);
  if (!xdr_int(xdrs, &objp->i2))
    return (FALSE);
  return (TRUE);
}

int rpc_tooltalk_handlehost(struct sockaddr_in *addr, char *host, int timer)
{
 int rpcsock;
 CLIENT *tt_client;
 struct sockaddr_in raddr;

 struct tt_reply op_res;
 struct timeval tv;
 char crapbuf[BUF_OVERFLOW_LEN], *path;

 memcpy(&raddr, addr, sizeof(raddr));
 raddr.sin_port = htons(0);

 tv.tv_sec = timer;
 tv.tv_usec = 0;

 memset(crapbuf, 'A', sizeof(crapbuf));
 rpcsock = RPC_ANYSOCK;

 tt_client = tclnttcp_create(&raddr, TOOLTALK_RPC, TOOLTALK_VERS,
		             &rpcsock, 0, 0, timer);
 if(!tt_client) {
  /*-- Traditionally ECOMM has nothing to do with our situation. But we
       endow it a NEW meaning: Any RPC communications failure. --*/
  if(errno != ETIMEDOUT) errno = ECOMM;
  return -1;
 }

 path = crapbuf;
 *(path + TOOLTALK_OVERFLOW_LEN) = 0;

 tt_client -> cl_auth = authunix_create_default();
 if(clnt_call(tt_client, 7, (xdrproc_t) xdr_wrapstring, (char *)&path, 
	      (xdrproc_t) xdr_tt_reply, (char *)&op_res, tv) != RPC_SUCCESS) 
   log("tooltalk - [%s] vulnerable tooltalk version.", 
       network_getname(host));
 else 
   log("tooltalk - [%s] tooltalk detected. vulnerable???.",
       network_getname(host));

 close(rpcsock);
 auth_destroy(tt_client->cl_auth);
 clnt_destroy(tt_client);

 return 1;
}

int rpc_mountd_handlehost(struct sockaddr_in *addr, char *host, int timer)
{
 int rpcsock;
 CLIENT *mount_client;
 struct sockaddr_in raddr;
 struct timeval retry_timeout, tv;
 struct fhstatus status;

 char crapbuf[BUF_OVERFLOW_LEN], *path;

 memset(crapbuf, 'A', sizeof(crapbuf));
 path = crapbuf;
 *(path + MOUNTD_OVERFLOW_LEN) = 0;

 memcpy(&raddr, addr, sizeof(raddr));
 raddr.sin_port = htons(0);

 retry_timeout.tv_sec = 3;
 retry_timeout.tv_usec = 0;

 tv.tv_sec = timer;
 tv.tv_usec = 0;

 rpcsock = RPC_ANYSOCK;
 if(!(mount_client = clntudp_create(&raddr, MOUNTD_RPC, MOUNTD_VERS, 
	                       retry_timeout, &rpcsock)))
 {
  errno = ECOMM;
  return -1;  
 }

 mount_client->cl_auth = authunix_create_default();
 if(clnt_call(mount_client, MOUNTPROC_MNT, (xdrproc_t) xdr_dirpath,
              (caddr_t)&path, (xdrproc_t) xdr_fhstatus,
              (caddr_t) &status, tv) != RPC_SUCCESS)
   log("rpc.mountd - [%s] likely vulnerable version.", 
       network_getname(host));
 else 
   log("rpc.mountd - [%s] service running, probably immune.", host);

 close(rpcsock);
 auth_destroy(mount_client->cl_auth);
 clnt_destroy(mount_client);

 return 1;

}

/* Log an rpc error */
void rpc_logerror(int err, char *host, int hook_slot)
{
  switch(err) 
  {
   case ETIMEDOUT	: 
    log("%s - [%s] RPC request timed out.",
              rpc_hooks[hook_slot].rpc_alias, host);
    break;
   case ECOMM		:
    log("%s - [%s] RPC service communication error.",
	      rpc_hooks[hook_slot].rpc_alias, host);
    break;
   default		:
    log("%s - [%s] unregistered RPC errno.",
	      rpc_hooks[hook_slot].rpc_alias, host);
  }
}
