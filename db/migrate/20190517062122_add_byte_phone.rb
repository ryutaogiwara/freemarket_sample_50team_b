class AddBytePhone < ActiveRecord::Migration[5.2]
  def up
    change_column :addresses, :phone_number, :integer, :limit => 8
  end

  def down
    change_column :addresses, :phone_number, :integer
  end
end
