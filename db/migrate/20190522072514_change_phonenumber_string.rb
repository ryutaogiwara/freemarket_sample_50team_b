class ChangePhonenumberString < ActiveRecord::Migration[5.2]
  def up
    change_column :addresses, :phone_number, :string
  end

  def down
    change_column :addresses, :phone_number, :bigint
  end
end
