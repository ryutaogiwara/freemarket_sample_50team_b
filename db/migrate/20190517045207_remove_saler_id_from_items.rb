class RemoveSalerIdFromItems < ActiveRecord::Migration[5.2]
  def change
    remove_column :items, :saler_id, :integer
  end
end
