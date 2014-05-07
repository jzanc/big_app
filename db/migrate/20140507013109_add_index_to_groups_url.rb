class AddIndexToGroupsUrl < ActiveRecord::Migration
  def change
    add_index :groups, :url, unique: true
  end
end
