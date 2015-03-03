# FormattedTimes

This gem simply overrides the 'method_missing' method of ActiveSupport::TimeWithZone class to provide methods that can be used for getting formatted time stamps. Basically this method uses strftime to get these timestamps.

## Installation

Add this line to your application's Gemfile:

    gem 'formatted_times'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install formatted_times

## Usage

  Once included in your rails application you can use any formatting method that is made out of joining the formatting arguments of strftimes by underscore.

  Any method name for formatting timestamps should start with 'frmt_' and then followed by the options to get time stamp. Following is the option's hash that is used to get strftime methods argument string :

	      {

	      # Date related options

	      'YY' => '%Y', # Year with century (can be negative, 4 digits at least)
          				# -0001, 0000, 1995, 2009, 14292, etc.
	      'CC' => '%C', #  year / 100 (round down.  20 in 2009)
	      'yy' => '%y', #  year % 100 (00..99)
	      'mm' => '%m', #  Month of the year, zero-padded (01..12)
				        # %_m  blank-padded ( 1..12)
				        # %-m  no-padded (1..12)
	      'BB' => '%B', #  The full month name (``January'')
          				# %^B  uppercased (``JANUARY'')
	      'bb' => '%b', # The abbreviated month name (``Jan'')
          				# %^b  uppercased (``JAN'')
	      'hh' => '%h', # Equivalent to %b
	      'dd' => '%d', # Day of the month, zero-padded (01..31)
          				# %-d  no-padded (1..31)
	      'ee' => '%e', # Day of the month, blank-padded ( 1..31)
	      'jj' => '%j', # Day of the year (001..366)

	      # Time related options

	      'HH' => '%H', # Hour of the day, 24-hour clock, zero-padded (00..23)
	      'kk' => '%k', # Hour of the day, 24-hour clock, blank-padded ( 0..23)
	      'II' => '%I', # Hour of the day, 12-hour clock, zero-padded (01..12)
	      'll' => '%l', # Hour of the day, 12-hour clock, blank-padded ( 1..12)
	      'PP' => '%P', # Meridian indicator, lowercase (``am'' or ``pm'')
	      'pp' => '%p', # Meridian indicator, uppercase (``AM'' or ``PM'')
	      'MM' => '%M', # Minute of the hour (00..59)
	      'SS' => '%S', # Second of the minute (00..59)
	      'LL' => '%L', #  Millisecond of the second (000..999)
	      'NN' => '%N', # Fractional seconds digits, default is 9 digits (nanosecond)
	      '3N' => '%3N', # Fractional miliseconds digits, 3 digits
	      '6N' => '%6N', # Fractional macroseconds digits, 6 digits
	      '9N' => '%9N', # Fractional nanoseconds digits, 9 digits
	      '12N' => '%12N', # Fractional picoseconds digits, 12 digits

	      # Time zone related Options

	      'zz' => '%z', # Time zone as hour and minute offset from UTC (e.g. +0900)
	      '1z' => '%:z', # hour and minute offset from UTC with a colon (e.g. +09:00)
	      '2z' => '%::z', # hour, minute and second offset from UTC (e.g. +09:00:00)
	      '3z' => '%:::z', # hour, minute and second offset from UTC (e.g. +09, +09:30, +09:30:30)
	      'ZZ' => '%Z', # Time zone abbreviation name

	      # Weekday related options

	      'AA' => '%A', # The full weekday name (``Sunday'')
          				# %^A  uppercased (``SUNDAY'')
	      'aa' => '%a', # The abbreviated name (``Sun'')
          				# %^a  uppercased (``SUN'')
	      'uu' => '%u', # Day of the week (Monday is 1, 1..7)
	      'ww' => '%w', # Day of the week (Sunday is 0, 0..6)

	      'GG' => '%G', # The week-based year
	      'gg' => '%g', # The last 2 digits of the week-based year (00..99)
	      'VV' => '%V', # Week number of the week-based year (01..53)
	      'UU' => '%U', # Week number of the year.  The week starts with Sunday.  (00..53)
	      'WW' => '%W', # Week number of the year.  The week starts with Monday.  (00..53)

	      # Seconds related opions

	      'ss' => '%s', # Number of seconds since 1970-01-01 00:00:00 UTC.
	      'QQ' => '%Q', # Number of microseconds since 1970-01-01 00:00:00 UTC.

	      # Literal string related options

	      'nn' => '%n', # Newline character (\n)
	      'tt' => '%t', # Tab character (\t)

	      # Combination Options

	      'cc' => '%c', # date and time (%a %b %e %T %Y)
	      'DD' => '%D', # Date (%m/%d/%y)
	      'FF' => '%F', # The ISO 8601 date format (%Y-%m-%d)
	      'vv' => '%v', # VMS date (%e-%b-%Y)
	      'xx' => '%x', # Same as %D
	      'XX' => '%X', # Same as %T
	      'rr' => '%r', # 12-hour time (%I:%M:%S %p)
	      'RR' => '%R', # 24-hour time (%H:%M)
	      'TT' => '%T' # 24-hour time (%H:%M:%S)
	    }

  If you need date, month and year out of timestamp then you can simply use :

    User.first.created_at.frmt_dd_mm_yy #=> "27 : 09 : 14"

    # Getting desizered seperator
    User.first.created_at.frmt_dd_mm_yy '/' #=> "27/09/14"

    # Usage:
    2.1.2 :012 > User.first.created_at.frmt_dd_hh_yy ', '
    => "27, Sep, 14"
    2.1.2 :020 > User.first.created_at.frmt_dd_hh_yy_HH_MM_SS
    => "27 : Sep : 14 : 08 : 44"

    # To format Date object :
    2.1.2 :002 > Date.today.frmt_dd_mm_yy
    => "21/06/16"

    # To format datetime object from current timestamp :
    2.1.2 :007 > Time.now.frmt_dd_hh_yy_HH_MM_SS
    => "21/Jun/16/13/49/16"

    2.1.2 :003 > DateTime.now.frmt_dd_hh_yy_HH_MM_SS
    => "21/Jun/16/13/50/16"


    # Multiple seperators
    2.1.2 :002 >  User.first.created_at.frmt_dd_mm_yy(', ', true)
    => "27,09 14"
    2.1.2 :006 >  User.first.created_at.frmt_dd_hh_yy(',-', true)
    => "27,Sep-14"


Methods from formatted times accepts two arguments a string as seperator and boolean to specify weather given separator is to be used as multiple separator string or single separator string. In case of multiple separator strings the separator strings are devided into character arrays and interleaved into the strftime methods option string.

Now you can add custom formats with a hash where its key will be the name of the method to call and value will be strftime argument string. Please refer following example.

	#Custom format definition
	FormattedTimes.define_formats({:short_date => '%d %h, %Y'})
	#after execution of above statement you can use
	User.first.created_at.short_date
	=> "18 Nov, 2014"


## Contributing

1. Fork it ( http://github.com/ravi-ture/formatted_times/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
