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
    def server
      require "lattice/server"

      Lattice::Server.new("127.0.0.1", 3000, root: Lattice.root).run
    end

    desc "new NAME", "alias for create"
    alias new create
  end
end