# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'qbuild/version'

Gem::Specification.new do |spec|
  spec.name          = "qbuild"
  spec.version       = Qbuild::VERSION
  spec.required_ruby_version = '>= 2.2.2'
  spec.authors       = ["Nico Schuele"]
  spec.email         = ["nico@padstone.io"]
  spec.summary       = "The easy build system"
  spec.description   = "Qbuild is an easy build system for JS, SCSS and CSS assets."
  spec.homepage      = "https://github.com/nicoschuele/qbuild"
  spec.license       = "Apache-2.0"
  spec.files         = Dir["{lib}/**/*", "{lib}/**/.*", "LICENSE.txt", "Rakefile", "README.md", "COC.md"]
  spec.executables   << 'qbuild'
  spec.require_paths = ["lib"]
  spec.add_dependency 'pad_utils', '>=1.14', '< 2.0'
  spec.add_dependency 'uglifier', '>=3.0.3', '< 3.1'
  spec.add_dependency 'sass', '>=3.4.22', '< 3.5'
end
