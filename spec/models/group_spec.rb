require 'spec_helper'

describe Group do
  before { @group = Group.new(name: "Example Group") }

  subject { @group }

  it { should respond_to(:name) }

  it { should be_valid }

  describe "when name is not present" do
    before { @group.name = " " }
    it { should_not be_valid }
  end
end
