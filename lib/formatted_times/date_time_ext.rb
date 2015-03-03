module DateTimeExt
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
    else
      raise NoMethodError, "undefined method `#{method_name}' for #{self.inspect}:#{self.class.name}"
    end

  rescue NoMethodError => e
    raise e, e.message.sub(self.inspect, self.inspect), e.backtrace
  end
end

class Date; include DateTimeExt end

class DateTime; include DateTimeExt end

class Time; include DateTimeExt end

