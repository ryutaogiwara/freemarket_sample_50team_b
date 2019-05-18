class ChangeColumnToNotNull < ActiveRecord::Migration[5.2]
  def up
    change_column :card_infos, :number, :integer, null: true
    change_column :card_infos, :month, :integer, null: true
    change_column :card_infos, :year, :integer, null: true
    change_column :card_infos, :security_code, :integer, null: true
  end

  def down
    change_column :card_infos, :number, :integer, null: false
    change_column :card_infos, :month, :integer, null: false
    change_column :card_infos, :year, :integer, null: false
    change_column :card_infos, :security_code, :integer, null: false
  end
end
