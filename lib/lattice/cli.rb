require 'thor'

module Lattice
  class CLI < Thor
    class_option :version, aliases: :v,
                           type: :boolean,
                           default: false,
                           desc: 'print the current Lattice version'

    def help
      if options[:version]
        require "lattice/version"

        puts "lattice #{Lattice::VERSION}"
      else
        super
      end
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