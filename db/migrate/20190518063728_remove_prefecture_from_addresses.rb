class RemovePrefectureFromAddresses < ActiveRecord::Migration[5.2]
  def change
    remove_column :addresses, :prefecture
    add_column :addresses, :prefecture, :integer
  end
end
