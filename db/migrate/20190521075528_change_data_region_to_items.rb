class ChangeDataRegionToItems < ActiveRecord::Migration[5.2]
  def change
    change_column :items, :region, :integer
  end
end
