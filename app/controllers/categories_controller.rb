class CategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_category, only: %i[show edit update destroy]

  def index
    @categories = current_user.categories.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = current_user.categories.new(category_params)
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
    @payments = Payment.where(user_id: current_user.id).where(category_id: @categories)
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    if @category.destroy
      flash[:notice] = 'Category removed successfully'
    else
      flash[:alert] = 'Category not removed'
    end
    redirect_to user_categories_path
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name, :image)
  end
end
