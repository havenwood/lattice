require 'thor'

module Lattice
  class CLI < Thor
    map "new" => :new
    desc "create [NAME]", "Create a new Lattice application called NAME (alias: new)"
    def create(name)
      require "lattice/generators/app_base"

      app_root = File.expand_path("./#{name}")
      Generators::AppBase.new(name).generate app_root
    end

    desc "server", "Launch a local Lattice server"
    method_option :addr, aliases: :a,
                         type:    :string,
                         default: "127.0.0.1",
                         desc:    "Listen on this address"
    method_option :port, aliases: :p,
                         type:    :numeric,
                         default: 3000,
                         desc:    "Bind to this port"
    def server
      require "lattice/server"

      Lattice::Server.new(options[:addr], options[:port], root: Lattice.root).run
    end

    map ["-v", "--version"] => :version
    desc "version", "Show the current Lattice version"
    def version
      require "lattice/version"

      shell.say "lattice #{Lattice::VERSION}"
    end
  end
end