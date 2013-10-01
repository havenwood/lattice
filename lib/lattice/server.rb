require 'reel'
require 'lattice'
require 'lattice/request_logger'

module Lattice
  class Server
    def initialize(host, port, options = {})
      @host, @port = host, port
      @root = options[:root] || Lattice.root
      load
    end

    def load
      $LOAD_PATH << @root
      require 'config/application'
    end

    def run
      app = Lattice.app

      app.configure do |config|
        config.ip      = @host
        config.port    = @port
        config.adapter = :Reel
      end

      Lattice.logger.info "A Reel good HTTP server! (Codename \"#{::Reel::CODENAME}\")"
      Lattice.logger.info "Listening on http://#{@host}:#{@port}"

      app.run
    end
  end
end