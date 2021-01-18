/*

xmalloc.c

Author: Liraz Siri <liraz@bigfoot.com>

Copyright (c) 1998 Liraz Siri <liraz@bigfoot.com>, Ariel, Israel,
	      All rights reserved.

Created: Sun Nov  8 20:45:20 IST 1998

stdlib.h memory allocation wrappers.

*/

#include <stdlib.h>
#include "xmalloc.h"
#include "log.h"

void *xmalloc(size_t size)
{
 void *vp;

 if(!(vp = malloc(size)))
  fatal("xmalloc: out of memory, unable to allocate <%ld> bytes", size);

 return vp; 
}

void xfree(void *ptr)
{
 if(!ptr)
  fatal("xfree: trying to free NULL pointer"); 
 free(ptr);
}

void *xrealloc(void *ptr, size_t size)
{
 void *vp;

 if(!(vp = realloc(ptr, size)))
  fatal("xrealloc: out of memory, unable to reallocate <%ld> bytes", size);

 return vp;
}
