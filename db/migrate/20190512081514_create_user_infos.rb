class CreateUserInfos < ActiveRecord::Migration[5.2]
  def change
    create_table :user_infos do |t|
      t.integer             :zipcode
      t.string              :prefecture
      t.string              :city
      t.string              :address
      t.string              :building_name
      t.integer             :user_id, null: false, foreign_key: true
      t.timestamps
    end
  end
end
