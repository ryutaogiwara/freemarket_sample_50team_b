class RemoveItemIdFromImages < ActiveRecord::Migration[5.2]
  def change
    remove_column :images, :item_id, :integer
  end
end
