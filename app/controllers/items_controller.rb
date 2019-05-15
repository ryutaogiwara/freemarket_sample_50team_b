class ItemsController < ApplicationController
  def index
    @items = Item.includes(:user).order("id DESC")
  end

  def new
  end

  def show
  end

  def edit
  end
  
end
