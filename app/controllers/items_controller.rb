class ItemsController < ApplicationController
  def index
    @items = Item.includes(:user).page(params[:page]).per(4).order("id DESC")
  end

  def new
  end

  def show
  end

  def edit
  end
  
end
