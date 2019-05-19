class RemoveUserIdFromItems < ActiveRecord::Migration[5.2]
    
  def up
    remove_column :items, :user_id, :integer
  end

  def down
    add_column :items, :user_id, :integer
  end
end
