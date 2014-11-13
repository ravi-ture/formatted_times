require "formatted_times/version"

module FormattedTimes
  formatting_options = {

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


  def method_missing(sym, *args, &block)
    puts sym.inspect, args.inspect, self.inspect, '------------------'
    method_name = sym.to_s
    if method_name.starts_with? 'frmt_'
      strf_time = get_strftime_string(method_name)
    else
      super
    end

  end

  def get_strftime_string(name)
    options = name.split('_')
    invalid_options = options - formatting_options.keys
    if invalid_options.empty?
      options.inject(''){ |strf_string, option|
        strf_string << formatting_options[option]
      }
    else
      raise ArgumentError, "Options #{invalid_options.join(', ')} are invalid."
    end
  end
end


ActiveSupport::TimeWithZone.send :include, FormattedTimes