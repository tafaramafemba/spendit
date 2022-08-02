class PaymentsController < ApplicationController
  def index
    @category = Category.find(params[:id])
    @payments = Payment.where(user_id: user.id).where(category_id: params[:category_id])
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
    @category = Category.find(params[:id])
    @payment.destroy
  end
  

  private

  def payment_params
    params.require(:payment).permit(:name, :amount, :category_id, :user_id)
  end
end
