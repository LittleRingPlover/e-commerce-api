class ShippingMethodsController < ApplicationController
  before_action :set_shipping_method, only: %i[ show update destroy ]

  # GET /shipping_methods
  # GET /shipping_methods.json
  def index
    @shipping_methods = ShippingMethod.all

    render :index, status: :ok
  end

  # GET /shipping_methods/1
  # GET /shipping_methods/1.json
  def show
    @shipping_method = ShippingMethod.find_by(id: params[:id])

    if @shipping_method.present?
      render :show, status: :ok
    else
      render json: { error: 'Shipping method not found' }, status: :not_found
    end
  end

  # POST /shipping_methods
  # POST /shipping_methods.json
  def create
    @shipping_method = ShippingMethod.new(shipping_method_params)

    if @shipping_method.save
      render :show, status: :created, location: @shipping_method
    else
      render json: @shipping_method.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /shipping_methods/1
  # PATCH/PUT /shipping_methods/1.json
  def update
    if @shipping_method.update(shipping_method_params)
      render :show, status: :ok, location: @shipping_method
    else
      render json: @shipping_method.errors, status: :unprocessable_entity
    end
  end

  # DELETE /shipping_methods/1
  # DELETE /shipping_methods/1.json
  def destroy
    @shipping_method.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shipping_method
      @shipping_method = ShippingMethod.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def shipping_method_params
      params.require(:shipping_method).permit(:name, :price)
    end
end
