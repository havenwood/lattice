require 'thor'

module Lattice
  class CLI < Thor
    desc "create NAME", "create a new Lattice application called NAME"
    def create(name)
      require 'lattice/generator'
      Generator.new(name).generate File.expand_path("./#{name}")
    end

    desc "new NAME", "alias for create"
    alias new create
  end
end