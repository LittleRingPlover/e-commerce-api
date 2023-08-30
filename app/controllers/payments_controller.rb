class PaymentsController < ApplicationController
  def index
    @payments = Payment.all

    render :index, status: :ok
  end

  def show
    @payment = Payment.joins(:payment_method).find_by(id: params[:id])

    if @payment.present?
      render :show, status: :ok
    else
      render json: { error: 'Payment not found' }, status: :not_found
    end
  end

  def create
  end

  def update
  end

  def destroy
  end
end
