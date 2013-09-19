require 'lattice/version'
require 'lattice/application'
require 'lattice/resource'
require 'pathname'

module Lattice
  class << self
    attr_writer :app

    def app
      raise "no application set" unless defined?(@app)
      @app
    end

    def root=(path)
      @root = Pathname.new(path)
    end

    def root
      @root || begin
        pwd = Dir.pwd
        gemfile = File.join pwd, 'Gemfile'

        # FIXME: Kinda hax :|
        unless File.read(gemfile)["gem 'lattice'"]
          raise "couldn't find app in: '#{Dir.pwd}'"
        end

        pwd
      end
    end
  end
end
