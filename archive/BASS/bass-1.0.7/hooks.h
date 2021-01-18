/*

hooks.h

Author: Liraz Siri <liraz@bigfoot.com>

Copyright (c) 1998 Liraz Siri <liraz@bigfoot.com>, Ariel, Israel
                   All rights reserved

Created: Sat Sep 12 00:28:48 GMT 1998

This is where vulnerability verification function hooks go. Note that
cgi function hooks aren't supposed to show up here, but in cgihooks.h

*/

#include "cgi.h"
#include "imapd.h"
#include "qpopper.h"
#include "bind.h"
#include "innd.h"
#include "wingate.h"

/* remote scan hooks */
struct scan_hook {
 const char *scan_alias;
 int (*scan_function)(struct sockaddr_in *addr, char *host, int timer);
};

struct scan_hook scan_hooks[] = {
 { "innd", innd_handlehost, },
 { "imapd", imapd_handlehost, },
 { "qpopper", qpopper_handlehost, },
 { "bind", bind_handlehost, },
 /* { "wingate", wingate_handlehost, }, */
 { NULL, NULL, }
}; 
 
