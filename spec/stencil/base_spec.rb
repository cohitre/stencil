require 'spec_helper'

describe Stencil::Base do
  let :sample_class do
    sample = Class.new(described_class)
    sample.needs :cool, :awesome, :great
    sample
  end

  describe ".needs" do
    it "should concatenate the passed arguments" do
      sample = Class.new(described_class)
      sample.needs :cool
      sample.needs.should == ["cool"]
      sample.needs :awesome, :great
      sample.needs.should == ["cool", "awesome", "great"]
    end
  end

  describe ".assert_keys" do
    it "should throw an exception if a required key is not present" do
      expect do
        sample_class.assert_keys [:cool, :awesome]
      end.to raise_error Stencil::MissingNeedError
    end

    it "should return true if all required keys are present" do
      sample_class.assert_keys([:cool, :awesome, :great]).should be_true
    end
  end

  describe "#initialize" do
    it "should call assert_keys" do
      sample_class.should_receive(:assert_keys)
      sample_class.new(
        cool: "1",
        awesome: "2",
        great: "3"
      )
    end

    it "should set the passed arguments as instance variables" do
      subject = sample_class.new(
        cool: "1",
        awesome: "2",
        great: "3"
      )
      subject.instance_variable_get("@cool").should == "1"
      subject.instance_variable_get("@awesome").should == "2"
      subject.instance_variable_get("@great").should == "3"
    end
  end
end
