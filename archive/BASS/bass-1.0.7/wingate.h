/*

wingate.h

Author: Liraz Siri <liraz@bigfoot.com>

Copyright (c) 1998 Liraz Siri <liraz@bigfoot.com>, Ariel, Israel
                   All rights reserved

Created: Created: Mon Nov  2 02:51:02 IST 1998

This is a moronic wingate 'detector' wooooo. I can't believe I'm actually
writing this.

*/

#define MAX_RESPONSE_SIZE	1024

/* what the fuck do you think this is?1?!?!?!?!? (stressed) */
int wingate_handlehost(struct sockaddr_in *addr, char *host, int timer);

