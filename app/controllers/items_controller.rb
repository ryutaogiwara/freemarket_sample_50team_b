class ItemsController < ApplicationController
  # before_action :authenticate_user!, only: :new

  def index
  end

  def new
    @item = Item.new
    @item.images.build  # buildを使うと親モデルに対する外部参照キーを自動でセットできる
  end

  def create
    @item = Item.new(item_params)
    if params[:images].present?
      if @item.save
        if image_params.each{ |image| @image = @item.images.create(image: image)}
           redirect_to root_path
        else
          render :new
        end
      end
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :state, :postage, :region, :shipping, :shipping_date, :price, :category, :size, :brand, images_attributes: [:image, :id]).merge(user_id: 1 )
  end

  def image_params
    params.require(:images).permit(image: [])[:image]
  end
end
