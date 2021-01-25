/*

rpchooks.h

Author: Liraz Siri <liraz@bigfoot.com>

Copyright (c) Liraz Siri <liraz@bigfoot.com>, Ariel, Israel
	      All rights reserved.

Created: Thu Oct  8 05:20:26 GMT 1998

Hooks, hooks and more hooks.

*/

#include "rpc.h"

struct rpc_hook {
 char *rpc_alias;
 unsigned long rpc_number;
 int (*rpc_function)(struct sockaddr_in *addr, char *host, int timer);
 int called;
};

struct rpc_hook rpc_hooks[] = {
 { "tooltalk", TOOLTALK_RPC, rpc_tooltalk_handlehost, 0, }, 
 { "mountd", MOUNTD_RPC, rpc_mountd_handlehost, 0, }, 
 { NULL, 0, NULL, }
};

