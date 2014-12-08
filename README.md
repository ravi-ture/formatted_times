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

	      'YY' => '%Y',
	      'CC' => '%C',
	      'yy' => '%y',
	      'mm' => '%m',
	      'BB' => '%B',
	      'bb' => '%b',
	      'hh' => '%h',
	      'dd' => '%d',
	      'ee' => '%e',
	      'jj' => '%j',

	      # Time related options

	      'HH' => '%H',
	      'kk' => '%k',
	      'II' => '%I',
	      'll' => '%l',
	      'PP' => '%P',
	      'pp' => '%p',
	      'MM' => '%M',
	      'SS' => '%S',
	      'LL' => '%L',
	      'NN' => '%N',
	      '3N' => '%3N',
	      '6N' => '%6N',
	      '9N' => '%9N',
	      '12N' => '%12N',

	      # Time zone related Options

	      'zz' => '%z',
	      '1z' => '%:z',
	      '2z' => '%::z',
	      '3z' => '%:::z',
	      'ZZ' => '%Z',

	      # Weekday related options

	      'AA' => '%A',
	      'aa' => '%a',
	      'uu' => '%u',
	      'ww' => '%w',

	      # Seconds related opions

	      'ss' => '%s',
	      'QQ' => '%Q',

	      # Literal string related options

	      'nn' => '%n',
	      'tt' => '%t',

	      # Combination Options

	      'cc' => '%c',
	      'DD' => '%D',
	      'FF' => '%F',
	      'vv' => '%v',
	      'xx' => '%x',
	      'XX' => '%X',
	      'rr' => '%r',
	      'RR' => '%R',
	      'TT' => '%T'
	    }

  Now if you need date, month and year out of timestamp then you can simply use :
    
    User.first.created_at.frmt_dd_mm_yy #=> "27 : 09 : 14"

    # Getting desizered seperator 
    User.first.created_at.frmt_dd_mm_yy '/' #=> "27/09/14"

    # Some simple usage: 
    2.1.2 :012 > User.first.created_at.frmt_dd_hh_yy ', '
    => "27, Sep, 14"
    2.1.2 :020 > User.first.created_at.frmt_dd_hh_yy_HH_MM_SS
    => "27 : Sep : 14 : 08 : 44" 


## Contributing

1. Fork it ( http://github.com/raviture91/formatted_times/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request