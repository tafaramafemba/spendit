class TransactionsController < ApplicationController
  def index
    @category = Category.find(params[:id])
    @payments = Payment.where(user_id: user.id).where(category_id: params[:category_id])
  end

  def new
    @category = Category.find(params[:id])
    @payment = Payment.new
  end

  def create
    @category = Category.find(params[:id])
    @payment = user.payments.new(payment_params)

    if @payment.save
      flash[:notice] = 'Payment saved successfully'
    else
      flash[:alert] = 'Payment not saved'
    end
    redirect_to user_categories_path

    def destroy
      @category = Category.find(params[:id])
      @payment.destroy
    end

    private

    def payment_params
      params.require(:payment).permit(:name, :amount, :category_id)
    end
end
