class ListingsController < ApplicationController
    # before_action :require_signin
  def index
    @items = Item.where(user_id: current_user.id, trade_status: 1).limit(3).order("created_at DESC")
  end

  def in_progress
    @reserveditems = Item.where(user_id: current_user.id, trade_status: 2).limit(5).order("created_at DESC")
    @shippeditems = Item.where(user_id: current_user.id, trade_status: 3).limit(5).order("created_at DESC")
  end

  def completed
    @items = Item.where(user_id: current_user.id, trade_status: 4).limit(10).order("created_at DESC")
  end

  def purchase
    @purchaseitems = Item.where(buyer_id: current_user.id, trade_status: 2).limit(5).order("created_at DESC")
    @purchaseditems = Item.where(buyer_id: current_user.id, trade_status: 3).limit(5).order("created_at DESC")
  end

  def purchased
    @items = Item.where(buyer_id: current_user.id, trade_status: 4).limit(10).order("created_at DESC")
  end

end

