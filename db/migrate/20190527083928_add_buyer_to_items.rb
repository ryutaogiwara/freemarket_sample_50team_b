class AddBuyerToItems < ActiveRecord::Migration[5.2]
  def change
    add_reference :items, :buyer
  end
end
