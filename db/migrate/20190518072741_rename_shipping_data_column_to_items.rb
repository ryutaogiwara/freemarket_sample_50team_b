class RenameShippingDataColumnToItems < ActiveRecord::Migration[5.2]
  def change
    rename_column :items, :shipping_data, :shipping_date
    rename_column :items, :saler_id, :user_id
  end
end
