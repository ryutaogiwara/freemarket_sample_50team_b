class InfosController < ApplicationController
  def index
  end
  def new
  end
  def edit
     @prefecture = Prefecture.find( params[:prefecture_id, :name])
  end
  def show
  end
end
