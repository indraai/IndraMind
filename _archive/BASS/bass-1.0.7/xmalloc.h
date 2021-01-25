/*

xmalloc.h

Author: Liraz Siri <liraz@bigfoot.com>

Copyright (c) 1998 Liraz Siri <liraz@bigfoot.com>, Ariel, Israel,
	      All rights reserved.

Created: Sun Nov  8 20:45:20 IST 1998

stdlib.h memory allocation wrappers.

*/

#include <stdlib.h>
#include "log.h"

void *xmalloc(size_t size);
void xfree(void *ptr);
void *realloc(void *ptr, size_t size);



