require 'spec_helper'
require 'ltsv'


describe Ltsv do
  let(:ltsv) { Ltsv.new }
  describe ".set" do
    subject{ ltsv.set(*set_attributes)  }
    context "when set_attributes is foo, hoge" do
      let(:set_attributes){ ["foo", "hoge"] }
      it {should be_nil}
    end

    it "when key foo assign hoge should return nil" do
      ltsv.set("foo", "blabla").should be_nil
    end

    it "when key foo assign hoge and piyo should return hoge" do
      ltsv.set("foo", "hoge")
      ltsv.set("foo", "piyo").should == 'hoge'
    end

    context "when invalid" do
      where(:key, :value) do
        [
          [nil, 'momo'],
          ['', 'gogo'],
          ['momo', nil]
        ]
      end
      with_them do
        it {expect { ltsv.set(key, value) }.to raise_error(ArgumentError)}
      end
    end

    it 'when value set blank' do
      expect { ltsv.set('momo', "") }.to_not raise_error(ArgumentError)
    end
  end

  describe ".get" do
    subject { ltsv.get("foo") }
    context "when key foo assign hoge should return nil" do
      before :each do
        ltsv.set("foo", "hoge")
      end
      it { should == "hoge" }
    end

    context "when key foo assign hoge should return nil" do
      before :each do
        ltsv.set("foo", "blabla")
      end
      it { should == "blabla" }
    end

    context 'when key not found' do
      it { should be_nil }
    end
  end

  describe ".dump" do
    subject { ltsv.dump }
    it {
      ltsv.set('foo', 'hoge')
      should == "foo:hoge\n"
    }
    it {
      ltsv.set('foo', 'hoge')
      ltsv.set('bar', 'fuga')
      should == "foo:hoge\tbar:fuga\n"
    }
    it {
      ltsv.set('foo', 'hoge')
      ltsv.set('bar', 'fuga')
      ltsv.set('foo', 'piyo')
      should == "bar:fuga\tfoo:piyo\n"
    }

    it {
      ltsv.set('foo', 'ho:ge')
      should == "foo:ho\\:ge\n"
    }

    it {
      ltsv.set('foo', "ho\tge")
      should == "foo:ho\\tge\n"
    }

    it {
      ltsv.set('foo', "ho\nge")
      should == "foo:ho\\nge\n"
    }

    it {
      ltsv.set('foo', 'hoge')
      ltsv.set('bar', 'fuga')
      ltsv.set('baz', 'fuga1')
      ltsv.set('foo', 'piyo')
      should == "bar:fuga\tbaz:fuga1\tfoo:piyo\n"
    }
  end

  describe "#parse" do
    let(:ltsv) { Ltsv.parse("foo:hoge\tbar:fuga\n") }

    where(:key, :value) do
      [
        ["foo", 'hoge'],
        ['bar', 'fuga']
      ]
    end

    with_them do
      it{ ltsv.get(key).should == value }
    end
  end
end
