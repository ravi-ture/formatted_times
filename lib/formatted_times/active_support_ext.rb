
module ActiveSupport
  class TimeWithZone
    include FormatTime

    def method_missing(sym, *args, &block)
      method_name = sym.to_s

      if method_name.starts_with? 'frmt_'
        if args.length.in?([1, 2]) and args[0].is_a?(String)
          strf_time_string = get_strftime_string(method_name, args[0], args[1])
        else
          strf_time_string = get_strftime_string(method_name)
        end
        return self.strftime(strf_time_string)
      end

      wrap_with_time_zone time.__send__(sym, *args, &block)
    rescue NoMethodError => e
      raise e, e.message.sub(time.inspect, self.inspect), e.backtrace
    end
  end
end