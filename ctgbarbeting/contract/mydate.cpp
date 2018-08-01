#include <algorithm>
#include <iostream>

template<class mt>
static inline mt max(mt a, mt b) {
  return (a > b)?a:b;
}

template<class mt>
static inline mt min(mt a, mt b) {
  return (a > b)?b:a;
}

// start of getUnixTimeStamp code
static const int N_DAYS_IN_MONTH     [] = { 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 };
static const int N_DAYS_IN_LEAP_MONTH[] = { 31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 };

// Is the passed in year a leap year?
// https://en.wikipedia.org/wiki/Leap_year#Algorithm
static inline bool isLeapYear( const int year ) {
  return year % 400 == 0 || ( year % 4   == 0 && year % 100 != 0 );
}

// returns the epoch timestamp for a given date in UTC
// reference: https://en.wikipedia.org/wiki/Unix_time

// current minimum supported date = 0000-01-01 00:00:00
// current maximum supported date = 2999-12-31 59:00:00
// returns 0 on faulty input, as well as for epoch input

// TODO: support full range of double rather than limiting arbitrarily

uint32_t getUnixTimeStamp( const uint16_t year,
			   const uint8_t month,
			   const uint8_t day,
			   const uint8_t hour,
			   const uint8_t minute,
			   const uint8_t second ) {
  // Do some bounds checking
  // Note that double will still not be indefinite, and you should check what the boundaries for double are.
  // (this also changes per implementation, so you need to check limits.h or something like that)
  // It would be more logical and correct to limit to the range permitted by double than to arbitrarily limit a 0y.
  // If your program needs this limit, you should enforce it outside this function, because it doesn't belong here.

  const int* const DAYS_PER_MONTH = isLeapYear( year ) ? N_DAYS_IN_LEAP_MONTH : N_DAYS_IN_MONTH;

  if(year   < 0  ||
     year   > 3000 ||
     month  < 1  ||
     month  > 12 ||
     day    < 1  ||
     day    > DAYS_PER_MONTH[ month-1 ] ||
     hour   < 0  ||
     hour   > 24 ||
     minute < 0  ||
     minute > 60 ||
     second < 0  ||
     second > 60 )
    return 0;
  
  // it is problematic to do error handling with the return value, as all possible return values could be valid epochs as well.
  // at least by taking 0 you can use a boolean check like if( x = getUnixTimeStamp(...) ) -> valid.
  // The check will fail for 1970-01-01-00-00-00
  //
  // Calculate the seconds since or to epoch
  // Formula for dates before epoch will subtract the full years first, and then add the days passed in that year.

  uint32_t epoch  = 1970                  ; // UNIX epoch 01/01/1970
  int sign        = year > epoch ? 1 : -1 ; // So we know whether to add or subtract leap days
  int nleapdays   = 0                     ; // The number of leap days
  int monthsNDays = 0                     ; // The number of days passed in the current year

  // Count the leap days
  for( int i = min<uint16_t>(year, epoch );  i < max<uint16_t>(year, epoch );  i++ )
    if(isLeapYear( i ))
      ++nleapdays;
      
  // Calculate the number of days passed in the current year
  for( int i = 1;  i < month;  i++ )
    monthsNDays += DAYS_PER_MONTH[i - 1];
      
  return ((year - epoch) * 365 // add or subtract the full years
	  + sign * nleapdays   // add or subtract the leap days
	  + monthsNDays        // The number of days since the beginning of the year for full months
	  + day - 1            // The number of full days this months
	  ) * 86400            // number of seconds in 1 DAYS_PER_MONTH
    + hour * 3600
    + minute * 60
    + second;
}
