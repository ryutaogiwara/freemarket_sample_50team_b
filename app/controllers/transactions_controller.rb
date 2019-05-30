class TransactionsController < ApplicationController
  require "payjp"

  before_action :move_to_sign_in
  before_action :set_item, only: [:order_status, :order_status_ship, :order_status_receive]
  before_action :set_buyerinfo, only: [:order_status]

  def new
    @item = Item.find(params[:item_id])
    @card = CardInfo.where(user_id: current_user.id).first
    #CardInfoテーブルからpayjpの顧客IDを検索
    if @card.blank?
      #登録された情報がない場合にカード登録画面に移動
      redirect_to new_user_card_info_path(user_id: current_user.id)
    else
      Payjp.api_key = 'sk_test_9657838e072f57e5edcf5496'
      #保管した顧客IDでpayjpから情報取得
      customer = Payjp::Customer.retrieve(@card.customer_id)
      #保管したカードIDでpayjpから情報取得、カード情報表示のためインスタンス変数に代入
      @default_card_information = customer.cards.retrieve(@card.card_id)
      @card_brand = @default_card_information.brand #カード会社のブランドアイコンを表示
      case @card_brand
      when "Visa"
        @card_src = "visa.svg"
      when "JCB"
        @card_src = "jcb.svg"
      when "MasterCard"
        @card_src = "master-card.svg"
      when "American Express"
        @card_src = "american_express.svg"
      when "Diners Club"
        @card_src = "dinersclub.svg"
      when "Discover"
        @card_src = "discover.svg"
      end
    end
  end

  def pay
    @item = Item.find(params[:item_id])
    card = CardInfo.where(user_id: current_user.id).first
    Payjp.api_key = 'sk_test_9657838e072f57e5edcf5496'
    Payjp::Charge.create(
      amount: @item.price, #支払金額を入力
      customer: card.customer_id, #顧客ID
      currency: 'jpy', #日本円
    )
    @item.update(purchase_params)
    redirect_to root_path, notice: "購入が完了しました" #完了画面に移動
    rescue => e
      redirect_to root_path, notice: "失敗しました"
  end

  def order_status
    @fee = (@item.price * 0.1).ceil
    @profit = @item.price - @fee
  end

  def order_status_ship
    if @item.present?
      @item.update(shipped_params) 
      redirect_to in_progress_listings_path
    else
      redirect_to root_path
    end
  end

  def order_status_receive
    if @item.present?
      @item.update(received_params) 
      redirect_to purchased_listings_path
    else
      redirect_to root_path
    end
  end

  private

  def move_to_sign_in
    redirect_to new_user_session_path unless user_signed_in?
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def set_buyerinfo
    @buyer = User.find(@item.buyer_id)
  end

  def purchase_params
    params.permit(:trade_status, :buyer_id).merge(trade_status: '2', buyer_id: current_user.id)
  end

  def shipped_params
    params.permit(:trade_status).merge(trade_status: '3' )
  end

  def received_params
    params.permit(:trade_status).merge(trade_status: '4' )
  end

end
