require 'fileutils'
require 'colorize'
require 'erb'
require 'active_support/inflector'

module Lattice
  class Generator
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

    # Create a directory within the application if it doesn't exit
    def generate_directory(path)
      if File.directory?(path)
        ohai "       exist".light_blue + "  #{path}"
      elsif File.exist?(path)
      else
        ohai "      create".light_green + "  #{path}"
        mkdir_p path
      end
    end

    # Render a file template and generate the associated output
    def generate_file(input_path, output_path)
      renderer = ERBRenderer.new(input_path, app_const_base: @app_const_base)
      generated_file = renderer.render

      if File.exist?(output_path)
        existing_file = File.read(output_path)
        if generated_file == existing_file
          ohai "   identical".light_blue + "  #{output_path}"
        else
          overwrite = prompt("Overwrite #{output_path}? [yn] ")
          if overwrite == "y"
            ohai "       force".light_yellow + "  #{output_path}"
            File.open(output_path, "w") { |f| f << generated_file }
          else
            ohai "        skip".light_yellow + "  #{output_path}"
          end
        end
      else
        ohai "      create".light_green + "  #{output_path}"
        File.open(output_path, "w") { |f| f << generated_file }
      end
    end

    # Tell the user something
    def ohai(message)
      puts message
    end


    class ERBRenderer
      def initialize(template, options)
        @template = template
        @options  = options
      end

      def render
        ERB.new(File.read(@template)).result(binding)
      end

      def app_const_base; @options[:app_const_base]; end
    end
  end
end