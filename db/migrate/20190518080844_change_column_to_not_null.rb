class ChangeColumnToNotNull < ActiveRecord::Migration[5.2]
  def up
    change_column_null :card_infos, :number, true
    change_column_null :card_infos, :month, true
    change_column_null :card_infos, :year, true
    change_column_null :card_infos, :security_code, true
  end

  def down
    change_column_null :card_infos, :number, false
    change_column_null :card_infos, :month, false
    change_column_null :card_infos, :year, false
    change_column_null :card_infos, :security_code, false
  end
end
