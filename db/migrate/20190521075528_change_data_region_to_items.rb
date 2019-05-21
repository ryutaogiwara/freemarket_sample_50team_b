class ChangeDataRegionToItems < ActiveRecord::Migration[5.2]
  def up
    change_column :items, :region, :integer
  end
  def down
    change_column :items, :region, :text
  end
end
