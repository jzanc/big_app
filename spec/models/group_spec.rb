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

  describe "when name is already taken" do
    before do
      group_with_same_name = @group.dup
      group_with_same_name.url = "ArbitraryUrlValue"
      group_with_same_name.save
    end

    it { should_not be_valid }
  end

  describe "when url is already taken" do
    before do
      group_with_same_url = @group.dup
      group_with_same_url.name = "ArbitraryNameValue"
      group_with_same_url.save
    end

    it { should_not be_valid }
  end

  describe "group page" do
    let(:user) { FactoryGirl.create(:user) }
    let(:group) { FactoryGirl.create(:group) }
    let!(:m1) { FactoryGirl.create(:micropost, user: user, group: group, content: "Foo") }
    let!(:m2) { FactoryGirl.create(:micropost, user: user, group: group, content: "Bar") }

    before { visit user_path(user) }

    it { should have_content(user.name) }
    it { should have_title(user.name) }

    describe "microposts" do
      it { should have_content(m1.content) }
      it { should have_content(m2.content) }
      it { should have_content(user.microposts.count) }
    end
  end
end
