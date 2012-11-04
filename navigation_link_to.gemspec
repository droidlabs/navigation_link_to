# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'navigation_link_to/version'

Gem::Specification.new do |gem|
  gem.name          = "navigation_link_to"
  gem.version       = NavigationLinkTo::VERSION
  gem.authors       = ["Droid Labs", "Iskander Haziev"]
  gem.email         = ["0@droidlabs.pro"]
  gem.description   = %q{navigation_link_to view helper}
  gem.summary       = %q{navigation_link_to view helper}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
