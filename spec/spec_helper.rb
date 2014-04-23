require 'coveralls'
Coveralls.wear!

require 'bundler/setup'
require 'lattice'

TMPDIR = File.expand_path("../../tmp", __FILE__)

RSpec.configure do
  def capture(stream)
    begin
      stream = stream.to_s
      eval "$#{stream} = StringIO.new"
      yield
      result = eval("$#{stream}").string
    ensure
      eval("$#{stream} = #{stream.upcase}")
    end

    result
  end
end