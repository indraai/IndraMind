/* boring, obvious, design devision code. */
#include "timeaux.h"

/* return current week day (0..6) */
int time_get_day(void)
{
 struct tm *tms;
 time_t t;

 time(&t);
 tms = gmtime(&t);
 return tms->tm_wday;
}

/* Return current hour (0..23) */
int time_get_hour(void)
{
 struct tm *tms;
 time_t t;

 time(&t);
 tms = gmtime(&t);
 return tms->tm_hour;
}

/* Return current minute (0..59) */
int time_get_minute(void)
{
 struct tm *tms;
 time_t t;

 time(&t);
 tms = gmtime(&t);
 return tms->tm_min;
}

/* Return elapsed seconds since 1970. Current time in seconds. */
time_t time_now(void)
{
 return time(NULL);
}

