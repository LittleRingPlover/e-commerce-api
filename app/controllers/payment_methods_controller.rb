class PaymentMethodsController < ApplicationController
  before_action :set_payment_method, only: %i[ show update destroy ]

  # GET /payment_methods
  # GET /payment_methods.json
  def index
    @payment_methods = PaymentMethod.all
  end

  # GET /payment_methods/1
  # GET /payment_methods/1.json
  def show
  end

  # POST /payment_methods
  # POST /payment_methods.json
  def create
    @payment_method = PaymentMethod.new(payment_method_params)

    if @payment_method.save
      render :show, status: :created, location: @payment_method
    else
      render json: @payment_method.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /payment_methods/1
  # PATCH/PUT /payment_methods/1.json
  def update
    if @payment_method.update(payment_method_params)
      render :show, status: :ok, location: @payment_method
    else
      render json: @payment_method.errors, status: :unprocessable_entity
    end
  end

  # DELETE /payment_methods/1
  # DELETE /payment_methods/1.json
  def destroy
    @payment_method.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_payment_method
      @payment_method = PaymentMethod.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def payment_method_params
      params.require(:payment_method).permit(:name)
    end
end
