class ShippingsController < ApplicationController
  def index
    @shippings = Shipping.all

    render :index, status: :ok
  end

  def show
    @shipping = Shipping.find_by(id: params[:id])

    if @shipping.present?
      render :show, status: :ok
    else
      render json: { error: 'Shipping not found' }, status: :not_found
    end
  end
end
