require 'spec_helper'

describe Group do
  before { @group = Group.new(name: "Example Group", url: "ExampleUrl") }

  subject { @group }

  it { should respond_to(:name) }
  it { should respond_to(:url) }
  it { should respond_to(:microposts) }
  

  it { should be_valid }

  describe "when name is not present" do
    before { @group.name = " " }
    it { should_not be_valid }
  end

  describe "when name is too long" do
    before { @group.name = "a" * 51 }
    it { should_not be_valid }
  end
  


  describe "when name is already taken" do
    before do
      group_with_same_name = @group.dup
      group_with_same_name.url = "ArbitraryUrlValue"
      group_with_same_name.save
    end

    it { should_not be_valid }
  end  
end
