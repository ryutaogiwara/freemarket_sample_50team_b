class AddUseridCredit < ActiveRecord::Migration[5.2]
  def change
    add_reference :card_infos, :user, foreign_key: true
  end
end
