require 'spec_helper'
require 'ltsv'


describe Ltsv do
  before :each do
    @ltsv = Ltsv.new
  end

  context ".set" do
    it "when key foo assign hoge should return nil" do
      @ltsv.set("foo", "hoge").should be_nil
    end

    it "when key foo assign hoge should return nil" do
      @ltsv.set("foo", "blabla").should be_nil
    end
  end

  context ".get" do
    it "when key foo assign hoge should return nil" do
      @ltsv.set("foo", "hoge")
      @ltsv.get("foo").should == "hoge"
    end

    it "when key foo assign hoge should return nil" do
      @ltsv.set("foo", "blabla")
      @ltsv.get("foo").should == "blabla"
    end
  end
end
