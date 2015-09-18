# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'logleaks/version'

Gem::Specification.new do |spec|
  spec.name          = "logleaks"
  spec.version       = Logleaks::VERSION
  spec.authors       = ["Chris Ewald"]
  spec.email         = ["chrisewald@gmail.com"]
  spec.summary       = %q{Simple production memory logging.}
  spec.description   = spec.summary
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.select {|path| path =~ /^test\/spec_.*\.rb/}
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency 'minitest', '~> 5.6'
end
