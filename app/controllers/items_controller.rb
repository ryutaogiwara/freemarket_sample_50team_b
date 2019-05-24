class ItemsController < ApplicationController
  # before_action :authenticate_user!, only: :new 後で使用する予定です
    before_action :set_item, only: [:show]
    before_action :move_to_index, except: [:index,:show]

  def index
    @items = Item.includes(:user).page(params[:page]).per(4).order("id DESC")
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
          render :index
        else
          redirect_to new_item_path
        end
      end
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    # binding.pry
    @item = Item.find(params[:id])
    if @item.update(edit_params)
      if params[:images].present?
        edit_params.each{ |image| @image = @item.images.create(image: image)}
        redirect_to root_path
      end
    else
      render :edit
    end
  end


  private

  def item_params
    params.require(:item).permit(:name, :description, :state, :postage, :region, :shipping, :shipping_date, :price, :category, :size, :brand, images_attributes: [:image, :id]).merge(user_id: current_user.id )
  end

  def edit_params
    params.require(:item).permit(:name, :description, :state, :postage, :region, :shipping, :shipping_date, :price, :category, :size, :brand, images_attributes: [:image, :id, :_destroy]).merge(user_id: current_user.id )
  end

  def image_params
    params.require(:images).permit(image: [])[:image]
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
