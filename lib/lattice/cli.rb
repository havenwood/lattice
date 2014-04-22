require 'thor'

module Lattice
  class CLI < Thor
    map ["-v", "--version"] => :version
    desc "version", "show the current Lattice version"
    def version
      require "lattice/version"

      shell.say "lattice #{Lattice::VERSION}"
    end

    desc "create NAME", "create a new Lattice application called NAME"
    def create(name)
      require "lattice/generators/app_base"

      app_root = File.expand_path("./#{name}")
      Generators::AppBase.new(name).generate app_root
    end

    desc "server", "launch a local Lattice server"
    method_option :addr, aliases: :a,
                         type:    :string,
                         default: "127.0.0.1",
                         desc:    "listen on this address"
    method_option :port, aliases: :p,
                         type:    :numeric,
                         default: 3000,
                         desc:    "bind to this port"
    def server
      require "lattice/server"

      Lattice::Server.new(options[:addr], options[:port], root: Lattice.root).run
    end

    desc "new NAME", "alias for create"
    alias new create
  end
end