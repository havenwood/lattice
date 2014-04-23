require 'spec_helper'
require 'lattice/cli'
require 'lattice/server'

describe Lattice::CLI do
  describe "create" do
    let(:example_app)  { "exemplifier" }
    let(:example_path) { File.join(TMPDIR, example_app) }

    before(:each) { FileUtils.rm_r(example_path) if File.directory?(example_path) }

    context "create command" do
      it "creates a new Lattice application" do
        FileUtils.cd(TMPDIR) { described_class.start ["create", example_app] }
      end
    end

    context "new command alias" do
      it "creates a new Lattice application" do
        FileUtils.cd(TMPDIR) { described_class.start ["new", example_app] }
      end
    end
  end

  describe "server" do
    it "sure could use some specs!" do
      pending "write some!"
    end
  end

  describe "version" do
    context "version command" do
      it "prints the current Lattice version" do
        output = capture(:stdout) { described_class.start ["version"] }
        expect(output.chomp).to eq("lattice #{Lattice::VERSION}")
      end
    end

    context "-v command alias" do
      it "prints the current Lattice version" do
        output = capture(:stdout) { described_class.start ["-v"] }
        expect(output.chomp).to eq("lattice #{Lattice::VERSION}")
      end
    end

    context "--version command alias" do
      it "prints the current Lattice version" do
        output = capture(:stdout) { described_class.start ["--version"] }
        expect(output.chomp).to eq("lattice #{Lattice::VERSION}")
      end
    end
  end
end