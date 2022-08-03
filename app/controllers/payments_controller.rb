class PaymentsController < ApplicationController
  before_action :set_category, only: %i[new create edit update destroy]
  before_action :set_payment, only: %i[edit update destroy]

  def index
    @category = Category.find(params[:id])
    @payments = Payment.where(user_id: user.id).where(category_id: params[:category_id])
    # @payments = current_user.payments.find_by(category_id: @category)
  end

  def new
    @category = Category.find(params[:user_id])
    @payment = Payment.new
  end

  def create
    @payment = current_user.payments.new(payment_params)
    p @payment
    @category = Category.find(params[:user_id])
    @payment.category_id = params[:category_id]

    if @payment.save
      flash[:notice] = 'Payment saved successfully'
    else
      flash[:alert] = 'Payment not saved'
    end
    redirect_to user_categories_path
  end 

  def destroy
    @payment = Payment.find(params[:category_id])
    @category = Category.find(params[:id])
    @payment.destroy

    if @payment.destroy
      flash[:notice] = 'Payment removed successfully'
    else
      flash[:alert] = 'Payment not removed'
    end
    redirect_to user_categories_path

  end
  

  private

  def set_payment
    @payment = Payment.find(params[:id])
  end

  def set_category
    @category = Category.find(params[:category_id])
  end

  def payment_params
    params.require(:payment).permit(:name, :amount, :category_id, :user_id)
  end
end
