class ItemsController < ApplicationController
  # before_action :authenticate_user!, only: :new

  def index
  end

  def new
    @item = Item.new
    @image = @item.images.build  # buildを使うと親モデルに対する外部参照キーを自動でセットできる
  end

  def create
    item = Item.new(item_params)
    # item.user = current_user
    item.save
    # binding.pry
    redirect_to new_item_path
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :state, :postage, :region, :shipping, :shipping_date, :price, :category, :size, :brand, images_attributes:[:id, :image, :item_id]).merge(user_id: 1 )
  end
end
