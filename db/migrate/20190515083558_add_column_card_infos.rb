class AddColumnCardInfos < ActiveRecord::Migration[5.2]
  def change
    add_column :card_infos, :customer_id, :string
    add_column :card_infos, :card_id, :string
  end
end
