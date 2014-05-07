require 'spec_helper'

describe Group do
  before { @group = Group.new(name: "Example Group", url: "ExampleUrl") }

  subject { @group }

  it { should respond_to(:name) }
  it { should respond_to(:url) }
  

  it { should be_valid }

  describe "when name is not present" do
    before { @group.name = " " }
    it { should_not be_valid }
  end

  describe "when url format is invalid" do
    it "should be invalid" do
      urls = %w["Invalid@Name" "Invalid!Name"]
      urls.each do |invalid_url|
        @group.url = invalid_url
        expect(@group).not_to be_valid
      end
    end
  end

  describe "when url format is valid" do
    it "should be valid" do
      urls = %w[ValidName validName valid_name valid-name valid_name]
      urls.each do |valid_url|
        @group.url = valid_url
        expect(@group).to be_valid
      end
    end
  end


  describe "when name is too long" do
    before { @group.name = "a" * 51 }
    it { should_not be_valid }
  end
  
  describe "when url is too long" do
    before { @group.url = "a" * 21 }
    it { should_not be_valid }
  end
end
