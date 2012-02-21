require 'spec_helper'

describe Dosage do
  let(:dosage) {Dosage.new}

  describe "#substance_name" do
    subject {dosage.substance_name}
    before { dosage.substance = Substance.new(name: "substance1")}
    it { should == "substance1"}
  end

end
