require 'spec_helper'
require 'lattice/generator'

describe Lattice::Generator do
  let(:example_app)  { "exemplifier" }
  let(:example_path) { File.join(TMPDIR, example_app) }

  before(:each) { FileUtils.rm_r(example_path) }

  it "generates Lattice template applications" do
    generator = described_class.new(example_app)
    generator.generate example_path
  end
end