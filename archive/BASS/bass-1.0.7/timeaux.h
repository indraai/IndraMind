/* boring, obvious, design devision code. */
#include <time.h>

/* return current week day (0..6) */
int time_get_day(void);

/* Return current hour (0..23) */
int time_get_hour(void);

/* Return current minute (0..59) */
int time_get_minute(void);

/* Return elapsed seconds since 1970. Current time in seconds. */
time_t time_now(void);

