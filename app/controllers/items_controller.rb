class ItemsController < ApplicationController
  # before_action :authenticate_user!, only: :new 後で使用する予定です
    before_action :set_item, only: [:show,:destroy]
    before_action :move_to_index, except: [:index,:show]
    before_action :set_prefecture, only: [:show]

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
          redirect_to root_path
        else
          render :new
        end
      end
    end
  end

  def show
  end

  def edit
  end

  def destroy
    @item.destroy if @item.user_id === current_user.id
    redirect_to controller: 'listings', action: 'index'
  end

  
  private

  def item_params
    params.require(:item).permit(:name, :description, :state, :postage, :region, :shipping, :shipping_date, :price, :category, :size, :brand, images_attributes: [:image, :id]).merge(user_id: current_user.id )
  end

  def image_params
    params.require(:images).permit(image: [])[:image]
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def set_prefecture
    @prefecture = Prefecture.find(@item.region)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
