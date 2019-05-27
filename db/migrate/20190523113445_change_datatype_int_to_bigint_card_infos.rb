class ChangeDatatypeIntToBigintCardInfos < ActiveRecord::Migration[5.2]
  def up
    change_column :card_infos, :number, :bigint
  end

  def down
    change_column :card_infos, :number, :integer
  end
end
