/*

cgihooks.h

Author: Liraz Siri <liraz@bigfoot.com>

Copyright (c) 1998 Liraz Siri <liraz@bigfoot.com>, Ariel, Israel
                   All rights reserved

Created: Sat Sep 12 00:53:21 IST 1998

cgi hook definitions. add cgi hooks here.

*/

#include "cgi.h"

struct cgi_hook {
 char *cgi_alias;
 int (*cgi_function)(struct sockaddr_in *addr, char *host, int timer);
};

/* The order in which the hooks apear in the cgi_hooks array, is also the
   order in which they will be called by the bass's handlehost
   routine */
struct cgi_hook cgi_hooks[] = {
 { "wwwcount", cgi_wwwcount_handlehost, },
 { "webdist", cgi_webdist_handlehost, },
 { "phf", cgi_phf_handlehost, },
 { "php", cgi_php_handlehost, },
 { "ews", cgi_ews_handlehost, },
/* { "campas", cgi_campas_handlehost, }, */ /* seems to be very rare */
 { "faxsurvey", cgi_faxsurvey_handlehost, },
 { "glimpse", cgi_glimpse_handlehost, },
 { "handler", cgi_handler_handlehost, },
 { "webgais", cgi_webgais_handlehost, },
 { "info2www", cgi_info2www_handlehost, },
 { "websendmail", cgi_websendmail_handlehost, },
/*
 { "textcount", cgi_textcount_handlehost, },
*/
 { NULL, NULL, }
};

