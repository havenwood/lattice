require 'thor'

module Lattice
  class CLI < Thor
    desc "create NAME", "create a new Lattice application called NAME"
    def create(name)
      require 'lattice/generators/app_base'

      app_root = File.expand_path("./#{name}")
      Generators::AppBase.new(name).generate app_root
    end

    desc "new NAME", "alias for create"
    alias new create
  end
end