class ChangeColumnToNotNull < ActiveRecord::Migration[5.2]
  def up
    change_column :card_infos, :number, :integer
    change_column :card_infos, :month, :integer
    change_column :card_infos, :year, :integer
    change_column :card_infos, :security_code, :integer
  end

  def down
    change_column :card_infos, :number, :integer, null: false
    change_column :card_infos, :month, :integer, null: false
    change_column :card_infos, :year, :integer, null: false
    change_column :card_infos, :security_code, :integer, null: false
  end
end
