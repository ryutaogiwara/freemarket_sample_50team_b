class ChangeTypePrefectureFromAddresses < ActiveRecord::Migration[5.2]
  def change
    remove_column :addresses, :prefecture
    add_column :addresses, :prefecture_id, :integer
  end
end
