require 'spec_helper'

describe Stencil::VERSION do
  it "should be a valid value" do
    Stencil::VERSION.should_not be_nil
  end
end
