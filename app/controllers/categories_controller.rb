class CategoriesController < ApplicationController
  load_and_authorize_resource  
  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    @category.user = User.find(params[:user_id])
    if @category.save
      flash[:notice] = 'Category saved successfully'
    else
      flash[:alert] = 'Category not saved'
    end
    redirect_to user_categories_path
  end

  def show
    @categories = Category.find(params[:id])
    @payments = Payment.where(category_id: @categories).where(user_id: current_user)

  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to user_categories_path
  end

  private

  def category_params
    params.require(:category).permit(:name, :image)
  end
end
