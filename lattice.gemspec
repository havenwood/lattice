# -*- encoding: utf-8 -*-
require File.expand_path('../lib/lattice/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Tony Arcieri"]
  gem.email         = ["tony.arcieri@gmail.com"]
  gem.description   = "A concurrent realtime web framework for Ruby"
  gem.summary       = "Lattice is a pervasively multithreaded web framework for Ruby which makes building realtime web applications with WebSockets simple and fun"
  gem.homepage      = "https://github.com/tarcieri/lattice"

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = 'lattice'
  gem.require_paths = ['lib']
  gem.version       = Lattice::VERSION
  
  gem.add_dependency 'celluloid',     '~> 0.14.0'
  gem.add_dependency 'reel',          '~> 0.3.0'
  gem.add_dependency 'webmachine',    '~> 1.1.0'
  gem.add_dependency 'activesupport', '~> 4.0.0'
  
  gem.add_development_dependency 'rake'
  gem.add_development_dependency "rspec", ">= 2.7.0"
end
