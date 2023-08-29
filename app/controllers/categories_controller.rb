class CategoriesController < ApplicationController
  before_action :set_category, only: %i[ update destroy ]

  def index
    @categories = Category.all

    render :index, status: :ok
  end

  def show
    @category = Category.find_by(id: params[:id])

    if @category.present?
      render :show, status: :ok
    else
      render json: { error: "Category not found" }, status: :not_found
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
  def set_category
    @category = Category.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def category_params
    params.require(:category).permit(:title)
  end
end
