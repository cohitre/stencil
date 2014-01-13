require 'spec_helper'

describe Stencil::HtmlHelpers do
  include Stencil::HtmlHelpers
  describe "#content_tag" do
    it "should add the attributes" do
      content_tag(:a, "Cool", href: "#great").should == '<a href="#great">Cool</a>'
    end

    it "should not include the attributes if they are empty" do
      content_tag(:a, "Cool").should == '<a>Cool</a>'
    end
  end

  describe "#html_attributes" do
    it "should return an empty string if no attributes" do
      html_attributes({}).should == ""
      html_attributes(nil).should == ""
    end

    it "should escape the attributes" do
      html_attributes("data-string" => 'richard "dick" branson').should == %q[ data-string="richard &quot;dick&quot; branson"]
    end

    it "should concatenate multiple attributes" do
      str = html_attributes(
        href: "/cool/href",
        class: "icon icon-edit"
      )
      str.should == %q[ href="/cool/href" class="icon icon-edit"]
    end

    it "should join arrays" do
      str = html_attributes(
        href: "/cool/href",
        class: ["icon", "icon-edit"]
      )
      str.should == %q[ href="/cool/href" class="icon icon-edit"]
    end
  end
end
