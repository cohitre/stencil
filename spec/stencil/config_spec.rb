require 'spec_helper'

describe Stencil::Config do
  describe ".paths" do
    it "should return an array of paths" do
      described_class.paths.should == []
      described_class.paths << "app"
      described_class.paths.should == ["app"]
    end
  end

  describe ".default_template_finder" do
    it "should return a TemplateFinder initialized with the right paths" do
      finder = described_class.default_template_finder
      finder.should be_a Stencil::TemplateFinder
      finder.paths.should == ["app"]
    end
  end
end
