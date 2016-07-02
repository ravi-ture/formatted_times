# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'formatted_times/version'

Gem::Specification.new do |spec|
  spec.name          = "formatted_times"
  spec.version       = FormattedTimes::VERSION
  spec.authors       = ["Ravi Ture"]
  spec.email         = ["raviture@gmail.com"]
  spec.summary       = %q{Provides way for clean formatted time stamps}
  spec.description   = %q{This gem simply overrides the method_missing of ActiveSupport::TimeWithZone module and includes the functionality for responding to various methods that will retrieve a time stamp in required format.}
  spec.homepage      = "https://github.com/ravi-ture/formatted_times"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rails", "~> 2.1.0"
end
