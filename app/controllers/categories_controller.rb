class CategoriesController < ApplicationController

  def index
  end

  def show
  end


  def new
    respond_to do |format|
      format.html
      format.json{
        @child_categories = Category.all.where(parent_id: params[:category_id])
        @grandchild_categories = Category.all.where(grandparent_id: params[:parent_id])
      }
    end
  end
end
