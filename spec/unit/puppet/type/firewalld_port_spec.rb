require 'spec_helper'

describe Puppet::Type.type(:firewalld_port) do

  before do
    Puppet::Provider::Firewalld.any_instance.stubs(:state).returns(:true)
  end

  context 'with no params' do
    describe 'when validating attributes' do
      [:name, :zone, :port, :protocol].each do |param|
        it "should have a #{param} parameter" do
          expect(described_class.attrtype(param)).to eq(:param)
        end
      end
    end

    describe 'namevar validation' do
      it 'has :name as its namevar' do
        expect(described_class.key_attributes).to eq([:name])
      end
    end
  end
end
