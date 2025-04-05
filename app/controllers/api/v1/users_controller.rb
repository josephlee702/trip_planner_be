class Api::V1::UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  def index
    users = User.all
    render json: users
  end

  def show
    render json: @user
  end

  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: {errors: @user.errors.full_messages }, status: 422
    end
  end

  def destroy
    @user.destroy
    render json: { message: "User successfully deleted." }, status: 200
  end

  private

  def set_user
    @user = User.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: "User was not found." }, status: 404
  end


  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
