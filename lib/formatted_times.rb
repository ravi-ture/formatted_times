require "formatted_times/version"

module ActiveSupport
  class TimeWithZone

    FORMATTING_OPTIONS = {

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
      method_name = sym.to_s

      if method_name.starts_with? 'frmt_'
        if args.length == 1 and args[0].is_a?(String)
          strf_time_string = get_strftime_string(method_name, args[0])
        else
          strf_time_string = get_strftime_string(method_name)
        end
        return self.strftime(strf_time_string)
      end

      wrap_with_time_zone time.__send__(sym, *args, &block)
    rescue NoMethodError => e
      raise e, e.message.sub(time.inspect, self.inspect), e.backtrace
    end

    def get_strftime_string(name, separator=' : ')
      options = name.split('_')
      options.shift
      invalid_options = options - FORMATTING_OPTIONS.keys

      raise ::ArgumentError, "Options #{invalid_options.join(', ')} are invalid." unless invalid_options.empty?

      options.collect{ |option| FORMATTING_OPTIONS[option] }.join(separator)

    end

  end
end