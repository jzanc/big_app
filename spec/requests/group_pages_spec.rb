require 'spec_helper'

describe "Group Pages" do

  subject { page }

  describe "create group page" do
    before { visit create_group_path }

    it { should have_content('Create Group') }
    it { should have_title(full_title('Create Group')) }
  end  
end

