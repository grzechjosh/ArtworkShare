class UsersController < ApplicationController
  def user_params
    params.require(:user).permit(:username)
  end
  def create
    user = User.create(user_params)
    if user.save
      render json: user
    else
      render json: user.errors.full_messages
    end
  end
  def destroy
    delUser = User.where(id: param[:id]).take!
    User.destroy(params[:id])
    render json: delUser
  end
  def index
    render json: User.all
  end
  def show
    render json: User.where(id: params[:id])
  end
  def update
    user = User.where(id: params[:id]).take!
    user.username = user_params[:username]
    if user.save
      render json: user
    else
      render json: user.errors.full_messages
    end
  end
end