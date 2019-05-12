class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.integer          :zipcord,       null: false
      t.string           :prefecture,    null: false
      t.string           :city,          null: false
      t.string           :address,       null: false
      t.string           :building_name
      t.integer          :phone_number
      t.integer       :user_id,       null: false, foreign_key: true
      t.timestamps
    end
  end
end
