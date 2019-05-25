class ItemsController < ApplicationController
  # before_action :authenticate_user!, only: :new 後で使用する予定です
    before_action :set_item, only: [:show, :destroy, :edit]
    before_action :move_to_index, except: [:index,:show]
    before_action :set_prefecture, only: [:show]

  def index
    # @ladies_items = Item.search(category_id_eq: '1').result.limit(4).includes(:images)
    # @mens_items = Item.search(category_id_eq: '2').result.limit(4).includes(:images)
    # @kids_items = Item.search(category_id_eq: '3').result.limit(4).includes(:images)
    # @cosme_items = Item.search(category_id_eq: '7').result.limit(4).includes(:images)
    # @chanel_items = Item.search(brand_eq: 'シャネル').result.limit(4).includes(:images)
    # @louisvitton_items = Item.search(brand_eq: 'ルイヴィトン').result.limit(4).includes(:images)
    # @supreme_items = Item.search(brand_eq: 'シュプリーム').result.limit(4).includes(:images)
    # @nike_items = Item.search(brand_eq: 'ナイキ').result.limit(4).includes(:images)
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
          respond_to do |format|
            format.html { redirect_to items_path }
            format.json
          end
        else
          render :new
        end
      end
    end
  end

  def edits
  end

  def update
    @item = Item.find(params[:id])
    if @item.update!(edit_params)
      if params[:images].present?
         image_params.each{ |image| @image = @item.images.create(image: image)}
         respond_to do |format|
            format.html { redirect_to item_path }
            format.json
         end
       else
        render template: "listings/index"
      end
    end
  end

  def show
  end

  def destroy
    @item.destroy if @item.user_id === current_user.id
    redirect_to controller: 'listings', action: 'index'
  end


  private

  def item_params
    params.require(:item).permit(:name, :description, :state, :postage, :region, :shipping, :shipping_date, :price, :category_id, :size, :brand, images_attributes: [:image]).merge(user_id: current_user.id )
  end

  def edit_params
    params.require(:item).permit(:name, :description, :state, :postage, :region, :shipping, :shipping_date, :price, :category_id, :size, :brand, images_attributes: [:image, :_destroy, :id]).merge(user_id: current_user.id )
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
