class ListingsController < ApplicationController
    # before_action :require_signin
  def index
    @items = Item.where(user_id: current_user.id, trade_status: 1).limit(3).order("created_at DESC")
  end

  def in_progress
    @reserveditem = Item.where(user_id: current_user.id, trade_status: 2).limit(3).order("created_at DESC")
    @shippeditem = Item.where(user_id: current_user.id, trade_status: 3).limit(3).order("created_at DESC")
  end

  def completed
    @items = Item.where(user_id: current_user.id, trade_status: 3).limit(3).order("created_at DESC")
  end

end

