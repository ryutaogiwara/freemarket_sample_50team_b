class RemoveUseridCredit < ActiveRecord::Migration[5.2]
  def change
    remove_column :card_infos, :user_id, :integer
  end
end
