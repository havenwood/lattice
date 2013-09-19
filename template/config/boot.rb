gemfile = ENV['BUNDLE_GEMFILE'] || File.expand_path('../../Gemfile', __FILE__)

require 'bundler/setup' if File.exists?(gemfile)

Lattice.root = File.expand_path('../..', __FILE__)