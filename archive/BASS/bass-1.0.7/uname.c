/*

uname.c

Author: Liraz Siri <liraz@bigfoot.com>

Copyright (c) 1998 Liraz Siri <liraz@bigfoot.com>, Ariel, Israel
                   All rights reserved

Created: Sat Sep 26 01:17:02 GMT 1998

Code for the indentification of a successfull run of uname.

*/

#include "BASS.h"
#include "uname.h"

struct os_signature {
 char *signature;
 int ident;
};

struct os_signature os_signatures[] = {
 { SIG_SUNOS,	OS_SUNOS   },
 { SIG_LINUX,	OS_LINUX   },
 { SIG_AIX,	OS_AIX     },
 { SIG_OSF,	OS_OSF     },
 { SIG_HPUX,	OS_HPUX    },
 { SIG_IRIX,	OS_IRIX    },
 { SIG_FREEBSD,	OS_FREEBSD },
 { SIG_UNICOS,	OS_UNICOS  },
 { NULL,	0 }
};

/* Returns true if the line contains any OS charachteristics */
int uname_ident(char *output)
{
 int i;
 for(i = 0; os_signatures[i].signature; i++) 
  if(strstr(output, os_signatures[i].signature)) 
   return os_signatures[i].ident;

 return -1;
}
