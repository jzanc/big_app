class CreateMicroposts < ActiveRecord::Migration
  def change
    create_table :microposts do |t|
      t.string :content
      t.integer :user_id
      t.integer :group_id

      t.timestamps
    end
    add_index :microposts, [:user_id, :group_id, :created_at]
  end
end
