# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'formatted_times/version'

Gem::Specification.new do |spec|
  spec.name          = "formatted_times"
  spec.version       = FormattedTimes::VERSION
  spec.authors       = ["Ravi-Ture"]
  spec.email         = ["raviture@gmail.com"]
  spec.summary       = %q{TODO: solve issue of :
                          2.1.2 :003 > 3.days.from_now
                            :advance
                            [{:days=>3}]
                            ------------------
                            NoMethodError: undefined method `advance' for Thu, 13 Nov 2014 07:39:03 UTC +00:00:ActiveSupport::TimeWithZone
                          }
  spec.description   = %q{TODO: Write a longer description. Optional.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
end
