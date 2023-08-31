class UsersController < ApplicationController
  def index
    @users = User.all

    render :index, status: :ok
  end

  def show
    @user = User.find_by(id: params[:id])

    if @user.present?
      render :show, status: :ok
    else
      render json: { error: 'User not found' }, status: :not_found
    end
  end
end
