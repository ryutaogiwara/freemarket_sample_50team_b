class TransactionsController < ApplicationController
  require "payjp"

  before_action :move_to_sign_in

  def new
    @item = Item.find(params[:item_id])
    card = CardInfo.where(user_id: current_user.id).first
    #CardInfoテーブルからpayjpの顧客IDを検索
    if card.blank?
      #登録された情報がない場合にカード登録画面に移動
      redirect_to new_user_card_info_path(user_id: current_user.id)
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      #保管した顧客IDでpayjpから情報取得
      customer = Payjp::Customer.retrieve(card.customer_id)
      #保管したカードIDでpayjpから情報取得、カード情報表示のためインスタンス変数に代入
      @default_card_information = customer.cards.retrieve(card.card_id)
    end
  end

  def pay
    @item = Item.find(params[:item_id])
    card = CardInfo.where(user_id: current_user.id).first
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    Payjp::Charge.create(
      amount: @item.price, #支払金額を入力
      customer: card.customer_id, #顧客ID
      currency: 'jpy', #日本円
    )
    redirect_to root_path, notice: "購入が完了しました" #完了画面に移動
    rescue => e
      redirect_to root_path, notice: "失敗しました"
  end

  def move_to_sign_in
    redirect_to new_user_session_path unless user_signed_in?
  end
end
