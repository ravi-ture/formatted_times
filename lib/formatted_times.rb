require "formatted_times/active_support_ext"
require "formatted_times/version"


module FormattedTimes
  def self.define_formats(formats)
    return false unless formats.is_a? Hash
    formats.each do |name, format|
      ActiveSupport::TimeWithZone.instance_eval {
        define_method name.to_sym do
          strftime(format)
        end
      }
    end
  end
end