require 'spec_helper'


describe NfcTag do
  it { should be_a_kind_of ActiveRecord::Base }
  it { should be_instance_of NfcTag }
  it { should respond_to :seat }
  context "#seat" do
    it { should be_instance_of Seat }
  end
end
