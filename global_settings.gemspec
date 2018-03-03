# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'global_settings/version'

Gem::Specification.new do |spec|
  spec.name          = "global_settings"
  spec.version       = GlobalSettings::VERSION
  spec.authors       = ["Rodrigo Pavano"]
  spec.email         = ["rodrigopavano@gmail.com"]
  spec.summary       = %q{Gem that provides an easy way to configure your app via ENV vars or yml files}
  spec.description   = %q{Gem that provides an easy way to configure your app via ENV vars or yml files}
  spec.homepage      = "https://github.com/rodrei/global_settings"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "activesupport", "~> 4.2"
  spec.add_runtime_dependency "tender_hash", "~> 0.0.3"
  spec.add_development_dependency "bundler", "~> 1.6"
end
