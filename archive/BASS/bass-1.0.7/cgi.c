/*

cgi.c

Author: Liraz Siri <liraz@bigfoot.com>

Copyright (c) 1998 Liraz Siri <liraz@bigfoot.com>, Ariel, Israel
                   All rights reserved

Created: Sat Sep 12 01:19:21 IST 1998
Updated: Sat Sep 26 05:16:13 GMT 1998 

Code for all the CGI hook functions over in cgihooks.h.

*/

/* 
 * Revision <Sat Sep 26 05:19:39 GMT 1998> : liraz :
 * 	- Modified cgi_makerequest to detect the presence or non-presence
 *	  of a requested CGI.
 *	- Created the generic evaluator routines using the uname_ident
 *	- call, including cgi_exec_uname, and cgi_evaluate_potential.
 *	- revised optimized, sliced and diced most of the CGI code.
 *	- Added most of the CGI hook routines. (based on nessus templates)
 *	- Fixed strseps (again).
 */

#include "BASS.h"
#include "uname.h"
#include "network.h"
#include "cgi.h"
#include "log.h"

char *strseps(char **stringp);

/* general cgi handler. We return -1 on failure and set errno = EBADRQC
   if the cgi script requested is not present. tconnect/twrite/network_gets
   will set thier own errno on failure and these can be handled at a higher
   level, as cgi_makerequest does not tamper with thier failure codes in any
   way. note that we allocate memory for response only if *response is
   handed out with the value of NULL. From the server we get a response
   of maximum max_response_size bytes, and max_response_lines lines. */

int cgi_makerequest(char *request, char **response, int max_response_size,
		    int max_response_lines, struct sockaddr_in *addr, 
		    int timer)
{
 char cgi_request[CGI_REQUEST_LEN], *cp;
 int wwwfd, n, received, received_lines;
 struct sockaddr_in raddr;

 cgi_request[CGI_REQUEST_LEN - 1] = '\0'; 
 memcpy(&raddr, addr, sizeof(struct sockaddr_in));
 raddr.sin_port = htons(WEBPORT);

 errno = 0;
 if((wwwfd = socket(AF_INET, SOCK_STREAM, IPPROTO_TCP)) < 0 ||
     tconnect(wwwfd, (struct sockaddr *)&raddr, sizeof( struct sockaddr ), 
     timer) < 0 ) return -1;

 snprintf(cgi_request, CGI_REQUEST_LEN - 1, CGI_TEMPLATE, request);
 if(network_twrite(wwwfd, cgi_request, strlen(cgi_request), timer) < 0)
  return -1;

 max_response_lines += CGI_HEADER_LEN;
 if( *response == NULL ) *response = malloc(max_response_size);
 for(received = 0, received_lines = 0; received < max_response_size && 
				       received_lines < max_response_lines; 
				       received += n, received_lines++) 
  if( (n = network_gets(wwwfd, (*response + received), 
		        max_response_size - received - 1, 10)) < 0)
  { 
   if( errno == ECONNRESET )  break;
   return -1;
  }

 close(wwwfd);
 /* Cgi not installed */
 if(!strstr(*response, CGI_HTTP_HEADER_10) &&
    !strstr(*response, CGI_HTTP_HEADER_11)) {
  errno = EBADRQC;
  return -1;
 }

 /* Skip the HTTP header. I'm not sure this is really a convention but
    on least on apache we receive double newlines after the header. */
 if((cp = strstr(*response, "\n\n"))) {
  cp += 2;
  received -= (cp - *response);
  memmove(*response, cp, received + 1);
 }

 return received;
}

/* Parse a buffer by newlines. Note that this WILL modify the original
   string. So its integrity is void once parsing it to newlines with
   strseps */
char *strseps(char **stringp)
{
 int i, j;
 const char delim[] = "\n\r";

 if( !(*stringp)[0] || !*stringp ) 
  return NULL;

 for(i = 0; (*stringp)[i]; i++) 
  for(j = 0; delim[j]; j++)
   if((*stringp)[i] == delim[j]) goto found_match;

 *stringp += i;
 return (*stringp - i);

found_match:

 (*stringp)[i] = '\0';
 *stringp += i + 1; 

 return (*stringp - i - 1);
}

/* cgi_exec_uname expects the request to handle the execution of uname,
   and will parse the server's reply checking for OS identification
   substrings you would expect to receive when executing uname.
   We return 1 if execution of uname was detected, 0 if execution
   was NOT detected, and -1 on any real error. Note that we put the output
   from uname in os_version, but don't deal with it's value otherwise.
   we take care of logging ourselves, and thus the need for cgi_alias */

int cgi_exec_uname(char *cgi_alias, char *request, struct sockaddr_in *addr, 
		   char *host, int timer)
{
 char *cgi_response, *stringp, *token;

 cgi_response = NULL;
 if(cgi_makerequest(request, &cgi_response, CGI_MAX_RESPONSE_SIZE,
		    CGI_DEFAULT_MAX_LINES, addr, timer) < 0) return -1;

 stringp = cgi_response;
 while((token = strseps(&stringp))) 
  if(uname_ident(token) != -1) { 
   token[20] = '\0';
   log("%s - [%s] vulnerable version detected (%s).", cgi_alias,
	     network_getname(host), token);
   return 1;
  }

 log("%s - [%s] immune/dummy cgi version.", cgi_alias, host);
 return 0;
}

/* This routine will attempt to assert wether or not a CGI is present
   on a remote web server. It takes care of it's OWN non-error logging,
   and should be called by hooks that don't/can't get a execution output
   (Ie. output from a program like uname/cat etc.), as a milder 
   alternative to cgi_exec_uname */
int cgi_evaluate_potential(char *cgi_alias, char *request, 
			   struct sockaddr_in *addr, char *host, int timer)
{
 char *cgi_response = NULL;
 if(cgi_makerequest(request, &cgi_response, CGI_MAX_RESPONSE_SIZE,
		    CGI_DEFAULT_MAX_LINES, addr, timer) < 0) return -1;

 log("%s - [%s] potentially (commonly) vulnerable cgi detected.",
     cgi_alias, network_getname(host));

 free(cgi_response);
 return 0; 
}

int cgi_wwwcount_handlehost(struct sockaddr_in *addr, char *host, int timer)
{
 char *cgi_response, *stringp, *token;

 cgi_response = NULL;
 if(cgi_makerequest(WWWCOUNT_REQUEST, &cgi_response, CGI_MAX_RESPONSE_SIZE, 
		    WWWCOUNT_LINES, addr, timer) < 0) return -1;
 
 stringp = cgi_response;

 if(!(token = strseps(&stringp)) || 
    strncasecmp(token, "GIF", 3) != 0) 
  return (errno = -1);

 if(!(token = strseps(&stringp)) || 
    strncasecmp(token, WWWCOUNT_REQUEST, strlen(WWWCOUNT_REQUEST)) != 0)  {
  log("wwwcount - [%s] no version returned, probably immune.", host);
  return 0;
 }

 token += strlen(WWWCOUNT_REQUEST) + 1;
 if( atof(token) < atof(WWWCOUNT_IMMUNE_VERSION) ) {
  log("wwwcount - [%s] probably vulnerable version (%s)",
      network_getname(host), token);
 } else log("wwwcount - [%s] immune version (%s)", host, token);
		  
 return 0;
}

int cgi_phf_handlehost(struct sockaddr_in *addr, char *host, int timer)
{
 char *cgi_response, *stringp, *token;

 cgi_response = NULL;
 if(cgi_makerequest(PHF_REQUEST, &cgi_response, CGI_MAX_RESPONSE_SIZE,
		    PHF_LINES, addr, timer) < 0) return -1;

 stringp = cgi_response;
 while((token = strseps(&stringp)))
  if( !strncasecmp(token, PHF_MARK, strlen(PHF_MARK)) ) break;
 if( !token ) return (errno = -1);

 if(token[strlen (token) - 1] == '\\') {
  log("phf - [%s] definately patched/immune version", host);
  return 0;
 }

 while((token = strseps(&stringp))) 
  if(uname_ident(token) != -1) {
   token[20] = '\0';
   log("phf - [%s] vulnerable version (%s)", network_getname(host),
	     token);
   return 0;
  }

 log("phf - [%s] possible dummy detected. immune.", host);
 return 0;
}

int cgi_campas_handlehost(struct sockaddr_in *addr, char *host, int timer)
{
 return cgi_exec_uname("campas", CAMPAS_REQUEST, addr, host, timer);
}

int cgi_faxsurvey_handlehost(struct sockaddr_in *addr, char *host, int timer)
{
 return cgi_exec_uname("faxsurvey", FAXSURVEY_REQUEST, addr, host, timer);
}

int cgi_webdist_handlehost(struct sockaddr_in *addr, char *host, int timer)
{
 return cgi_exec_uname("webdist", WEBDIST_REQUEST, addr, host, timer);
}

int cgi_ews_handlehost(struct sockaddr_in *addr, char *host, int timer)
{
 return cgi_evaluate_potential("ews (Excite search)", EWS_REQUEST, addr,
			       host, timer);
}

int cgi_glimpse_handlehost(struct sockaddr_in *addr, char *host, int timer)
{
 return cgi_evaluate_potential("glimpse", GLIMPSE_REQUEST, addr, host, timer);
}

int cgi_handler_handlehost(struct sockaddr_in *addr, char *host, int timer)
{
 return cgi_exec_uname("handler", HANDLER_REQUEST, addr, host, timer);
}

int cgi_info2www_handlehost(struct sockaddr_in *addr, char *host, int timer)
{
 return cgi_evaluate_potential("info2www", INFO2WWW_REQUEST, addr, host, timer);
}

int cgi_webgais_handlehost(struct sockaddr_in *addr, char *host, int timer)
{
 return cgi_evaluate_potential("webgais", WEBGAIS_REQUEST, addr, host, timer);
}

int cgi_websendmail_handlehost(struct sockaddr_in *addr, char *host, int timer)
{
 return cgi_evaluate_potential("websendmail", WEBSENDMAIL_REQUEST, addr, host, 
			       timer);
}

int cgi_php_handlehost(struct sockaddr_in *addr, char *host, int timer)
{
 int wwwfd, received, n;
 char *cgi_response = NULL;
 char *buff, *crap;
 struct sockaddr_in raddr;

 if(cgi_makerequest(PHP_REQUEST, &cgi_response, CGI_MAX_RESPONSE_SIZE,
	 	    CGI_DEFAULT_MAX_LINES, addr, timer) < 0) return -1;
 free(cgi_response);

 memcpy(&raddr, addr, sizeof(raddr));
 raddr.sin_port = htons(WEBPORT);

 /*-- php is present on remote web server --*/
 if((wwwfd = socket(AF_INET, SOCK_STREAM, IPPROTO_TCP)) < 0 ||
    tconnect(wwwfd, (struct sockaddr *)&raddr, sizeof(struct sockaddr), 
	     timer) < 0) return -1;
 
 /*-- This is rediculous. Why would there be a problem allocating rougly
      3k??? BTW, we have to send the request ourselves because cgi_makerequest
      is limited to a 256 byte long request length --*/
 if(!(buff = (char *)alloca(PHP_REQUEST_LEN)) ||
    !(crap = (char *)alloca(PHP_OVERFLOW_LEN + strlen(PHP_REQUEST) + 1)))
 {
  errno = ENOMEM;
  return -1;
 }

 strcpy(crap, PHP_REQUEST);
 memset((crap + strlen(PHP_REQUEST)), 'A', PHP_OVERFLOW_LEN);
 crap[PHP_OVERFLOW_LEN + strlen(PHP_REQUEST)] = 0;

 snprintf(buff, PHP_REQUEST_LEN - 1, CGI_TEMPLATE, crap);

 network_twrite(wwwfd, buff, strlen(buff), timer);
 for(received = 0; received < PHP_REQUEST_LEN - 1; received += n)
  if((n = network_gets(wwwfd, (buff + received), 
		       PHP_REQUEST_LEN - received - 1, timer)) < 0) 
   break;

 if(!strstr(buff, CGI_HTTP_HEADER_10) &&
    !strstr(buff, CGI_HTTP_HEADER_11)) {
  log("php - [%s] detected vulnerable (bufferoverflowed) cgi.",
	    network_getname(host)); 

  return 0;
 }

 log("php - [%s] probably immune/dummy cgi version.", host);
 return 0;
}
