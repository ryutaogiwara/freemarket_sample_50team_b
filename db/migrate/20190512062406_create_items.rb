class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.string :image, null: false
      t.text :description, null: false
      t.string :state, null: false
      t.string :postage, null: false
      t.string :region, null: false
      t.string :shipping, null: false
      t.string :shipping_data, null: false
      t.integer :price, null: false
      t.string :category, null: false
      t.string :size, null: false
      t.string :brand
      t.integer :saler_id, null: false, foreign_key: true
      t.integer :transaction_id, null: false, foreign_key: true

      t.timestamps
    end
  end
end
