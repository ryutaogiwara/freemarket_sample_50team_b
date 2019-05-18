class RemoveTransactionIdToItems < ActiveRecord::Migration[5.2]
  def change
    remove_column :items, :transaction_id
  end
end
