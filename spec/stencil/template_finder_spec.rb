require 'spec_helper'

describe Stencil::TemplateFinder do
  subject do
    described_class.new
  end

  describe "#find_all" do
    it "should not find partially matched files" do
      subject.paths << "spec/fixtures"
      subject.extensions << :haml
      subject.extensions << :erb
      results = subject.find_all "user_profile_stenc"
      results.should == []
    end

    it "should find all matching files in the given paths" do
      subject.paths << "spec/fixtures"
      subject.extensions << :haml
      subject.extensions << :erb
      results = subject.find_all "user_profile_stencil"
      results.should == ["spec/fixtures/user_profile_stencil.html.erb"]
    end
  end

  describe "#find" do
    it "gets the first matching file" do
      subject.paths << "spec/fixtures"
      subject.extensions << :haml
      subject.extensions << :erb
      results = subject.find "user_profile_stencil"
      results.should == "spec/fixtures/user_profile_stencil.html.erb"
    end

    it "raises an error if the file does not exist" do
      subject.paths << "spec/fixtures"
      subject.extensions << :haml
      subject.extensions << :erb
      expect do
        subject.find "user_profile_s"
      end.to raise_error(Stencil::TemplateNotFoundError)
    end
  end
end
