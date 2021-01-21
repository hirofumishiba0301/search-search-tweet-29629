class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_user, only: [:show, :edit, :update]

  def show
    @articles = Article.includes(:user).order('created_at DESC')
  end

  def edit
    redirect_to user_path unless @user.id == current_user.id
  end

  def update
    if @user.update(user_params)
      render :show
    else
      render :edit
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:nickname, :email, :password, :birthday)
  end
end
