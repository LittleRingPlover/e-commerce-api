class OrdersController < ApplicationController
  before_action :set_order, only: %i[ show update destroy ]

  # GET /orders
  def index
    @orders = Order.all

    render :index, status: :ok
  end

  # GET /orders/1
  def show
    @order = Order.find_by(id: params[:id])
    
    if @order.present?
      render :show, status: :ok
    else
      render json: { error: 'Order not found' }, status: :not_found
    end
  end

  # POST /orders
  def create
    @order = Order.new(order_params)

    if @order.save
      render json: @order, status: :created, location: @order
    else
      render json: @order.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /orders/1
  def update
    if @order.update(order_params)
      render json: @order
    else
      render json: @order.errors, status: :unprocessable_entity
    end
  end

  # DELETE /orders/1
  def destroy
    @order.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def order_params
      params.fetch(:order, {})
    end
end
