# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'qbuild/version'

Gem::Specification.new do |spec|
  spec.name          = "qbuild"
  spec.version       = Qbuild::VERSION
  spec.required_ruby_version = '>= 2.0'
  spec.authors       = ["Nico Schuele"]
  spec.email         = ["nico@padstone.io"]
  spec.summary       = "Gem summary"
  spec.description   = "Gem description"
  spec.homepage      = "https://github.com/nicoschuele/qbuild"
  spec.license       = "Apache-2.0"
  spec.files         = Dir["{lib}/**/*", "{lib}/**/.*", "LICENSE.txt", "Rakefile", "README.md"]
  spec.executables   << 'qbuild'
  spec.require_paths = ["lib"]
end
