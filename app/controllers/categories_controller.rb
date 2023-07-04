class CategoriesController < ApplicationController
    before_action :authenticate_user!
  
    def index
      @categories = current_user.categories
    end
  
    def new
      @category = current_user.categories.build
    end
  
    def create
      @category = current_user.categories.build(category_params)
      if @category.save
        flash[:notice] = 'Category created successfully.'
        redirect_to categories_path
      else
        render 'new'
      end
    end
  
    private
  
    def category_params
      params.require(:category).permit(:name, :icon)
    end
  end
  