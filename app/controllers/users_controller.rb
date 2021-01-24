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

  def follow
    @user = User.find(params[:id])
    @users = @user.follows
    #render 'show_follow'
  end

  def followers
    @user = User.find(params[:id])
    @users = @user.followers
    #render 'show_follower'
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:user_image, :nickname, :email, :password, :birthday)
  end
end
