require 'fileutils'
require 'erb'

require 'lattice/generator'
require 'active_support/inflector'
require 'colorize'

module Lattice
  module Generators
    class AppBase
      include Generator
      include FileUtils

      DEFAULT_APP_TEMPLATE = File.expand_path("../../../template", __FILE__)

      def initialize(name, options = {})
        @name = name.to_s
        @app_const_base = @name.camelize

        @template_path = options[:template_path] || DEFAULT_APP_TEMPLATE
      end

      # Generate a Lattice application at the given path
      def generate(app_root)
        app_root = File.expand_path(app_root)
        template_paths = Dir[File.join(@template_path, '**', '*')]
        raise "No templates found. Something's wrong? :(" if template_paths.empty?

        template_paths.each do |input_path|
          relative_path = input_path.sub(@template_path, '')
          output_path   = File.join(app_root, relative_path)

          if File.directory?(input_path)
            generate_directory(output_path)
          else
            generate_file(input_path, output_path)
          end
        end
      end
    end
  end
end