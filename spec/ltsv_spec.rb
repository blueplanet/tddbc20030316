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

    it "when key foo assign hoge and piyo should return hoge" do
      @ltsv.set("foo", "hoge").should be_nil
      @ltsv.set("foo", "piyo").should == 'hoge'
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

  context ".dump" do
    it {
      @ltsv.set('foo', 'hoge')
      @ltsv.dump.should == "foo:hoge\n"
    }
    it {
      @ltsv.set('foo', 'hoge')
      @ltsv.set('bar', 'fuga')
      @ltsv.dump.should == "foo:hoge\tbar:fuga\n"
    }
    it {
      @ltsv.set('foo', 'hoge')
      @ltsv.set('bar', 'fuga')
      @ltsv.set('foo', 'piyo')
      @ltsv.dump.should == "bar:fuga\tfoo:piyo\n"
    }
    it {
      @ltsv.set('foo', 'hoge')
      @ltsv.set('bar', 'fuga')
      @ltsv.set('baz', 'fuga1')
      @ltsv.set('foo', 'piyo')
      @ltsv.dump.should == "bar:fuga\tbaz:fuga1\tfoo:piyo\n"
    }
  end
end
