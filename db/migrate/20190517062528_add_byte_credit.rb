class AddByteCredit < ActiveRecord::Migration[5.2]
  def up
    change_column :card_infos, :number, :integer, :limit => 8
  end

  def down
    change_column :card_infos, :number, :integer
  end
end
