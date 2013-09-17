module Lattice
  module Generator
    # Create a directory within the application if it doesn't exit
    def generate_directory(path)
      if File.directory?(path)
        ohai "       exist".light_blue + "  #{path}"
      elsif File.exist?(path)
         ohai "    conflict".light_red + " #{output_path}"
         ohai "Template resumes #{output_path} is a directory!"
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
          ohai "    conflict".light_red + " #{output_path}"
          overwrite = prompt("Overwrite #{output_path}? [yn] ")
          if overwrite == "y"
            ohai "       force".light_yellow + "  #{output_path}"
            File.open(output_path, "w") { |f| f << generated_file }
          else
            ohai "        skip".light_yellow + "  #{output_path}"
          end
        end
      else
        directory = File.dirname(output_path) + "/"
        generate_directory(directory) unless File.directory?(directory)
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