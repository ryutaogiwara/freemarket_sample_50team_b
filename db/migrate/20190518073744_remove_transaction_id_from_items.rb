class RemoveTransactionIdFromItems < ActiveRecord::Migration[5.2]
  def up
    remove_column :items, :transaction_id
  end

  def down
    add_column :items, :transaction_id, :integer
  end
end
