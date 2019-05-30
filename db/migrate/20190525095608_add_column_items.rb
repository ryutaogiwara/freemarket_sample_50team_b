class AddColumnItems < ActiveRecord::Migration[5.2]
  def up
    add_column :items, :trade_status, :integer, null: false
  end

  def down
    remove_column :items, :trade_status, :integer, null: false
  end
end
