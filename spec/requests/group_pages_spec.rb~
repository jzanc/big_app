require 'spec_helper'

describe "Group Pages" do

  subject { page }

  describe "create group page" do
    before { visit create_group_path }

    it { should have_content('Create Group') }
    it { should have_title(full_title('Create Group')) }
  end  

  describe "create group" do
    before { visit create_group_path }
    let(:submit) { "Create Group" }

    describe "with invalid information" do
      it "should not create a group" do
        expect { click_button submit }.not_to change(Group, :count)
      end
    end

    describe "with valid information" do
      before do
        fill_in "Name", with: "Example Group"
        fill_in "Url" , with: "Example_Url"
      end

      it "should create a group" do
        expect { click_button submit }.to change(Group, :count).by(1)
      end
    end
  end

  describe "group page" do
    let(:group) { FactoryGirl.create(:group) }
    before { visit group_path(group) }

    it { should have_content(group.name) }
    it { should have_title(group.name) }
  end
end

