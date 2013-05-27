# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'breadnbutter/version'

Gem::Specification.new do |spec|
  spec.name          = "breadnbutter"
  spec.version       = BreadnButter::VERSION
  spec.authors       = ["Jack Desert"]
  spec.email         = ["jackdesert@gmail.com"]
  spec.description   = %q{Craft generic breadcrumbs from the controller path}
  spec.summary       = %q{Most of the times when I use a breadcrumb, the requirements are really simple: show me what object I'm looking, and what its parent is, and give me links back to either the parent, the view, or the root.}
  spec.homepage      = "http://github.com/jackdesert/breadnbutter"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
