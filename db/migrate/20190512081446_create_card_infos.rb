class CreateCardInfos < ActiveRecord::Migration[5.2]
  def change
    create_table :card_infos do |t|
      t.integer          :number, null: false
      t.integer          :month,  null: false
      t.integer          :year,   null: false
      t.integer          :security_code, null: false
      t.integer          :user_id, null: false, foreign_key: true
      t.timestamps
    end
  end
end
