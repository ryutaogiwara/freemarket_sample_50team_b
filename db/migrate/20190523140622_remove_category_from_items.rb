class RemoveCategoryFromItems < ActiveRecord::Migration[5.2]
  def up
    remove_column :items, :category, :string
  end

  def down
    add_column :items, :category, :string
  end

end
