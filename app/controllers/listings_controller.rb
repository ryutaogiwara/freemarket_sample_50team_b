class ListingsController < ApplicationController
    # before_action :require_signin
  def index
    @items = Item.where(user_id: current_user.id).limit(3).order("created_at DESC")

  end
end

