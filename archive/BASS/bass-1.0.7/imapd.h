/*

imapd.h

Author: Liraz Siri <liraz@bigfoot.com>

Copyright (c) 1998 Liraz Siri <liraz@bigfoot.com>, Ariel, Israel
                   All rights reserved

Created: Sat Sep 12 08:48:48 GMT 1998

Code for the hook to test for the latest imapd 4 vulnerability, 
by version.

*/

#define IMAPPORT 	143
#define S_IMAP		"IMAP"
#define S_IMAP_2BIS     "IMAP2bis"
#define S_IMAP_REV1     "IMAP4rev1"

#define MBUFSIZ		256
#define MMINHDRLEN      30

#define IMAP_REV1_IMMUNE_VERSION     "10.234"
#define IMAP_2BIS_IMMUNE_VERSION     "7.8"
#define IMAP_OVERFLOW_LEN	     4096

#define IMAP_REV1_OVERFLOW_TEMPLATE	"* AUTHENTICATE {%d}\r\n%s\r\n"
#define IMAP_2BIS_OVERFLOW_TEMPLATE     "* LOGIN {%d}\r\n\%s\r\n"

/* imapd hook */
int imapd_handlehost(struct sockaddr_in *addr, char *host, int timer);
