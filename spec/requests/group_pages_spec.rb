require 'spec_helper'

describe "Group Pages" do

  subject { page }

  describe "create group page" do
    before { visit create_group_path }

    it { should have_content('Create Group') }
    it { should have_title(full_title('Create Group')) }
  end  

  describe "group page" do
    let(:group) { FactoryGirl.create(:group) }
    before { visit group_path(group) }

    it { should have_content(group.name) }
    it { should have_title(group.name) }
  end
end

