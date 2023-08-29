class DiscountsController < ApplicationController
  before_action :set_discount, only: %i[ update destroy ]
  
  def index
    @discounts = Discount.all

    render :index, status: :ok
  end

  def show
    @discount = Discount.find_by(id: params[:id])

    if @discount.present?
      render :show, status: :ok
    else
      render json: { error: "Discount not found" }, status: :not_found
    end
  end

  def create
  end

  def update
  end

  def destroy
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_discount
    @discount = Discount.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def discount_params
    params.require(:discount).permit(:title, :description, :discount_percent)
  end
end