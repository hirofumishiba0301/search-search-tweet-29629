class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_user, only: [:show, :edit, :update]
  before_action :search_article

  def show
    @articles = Article.includes(:user).order('created_at DESC')
    @articles_count = Article.joins(:user).group("users.nickname").order('count_all DESC').count 
    @tags = Article.tag_counts_on(:tags).order('count DESC')
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
  end

  def followers
    @user = User.find(params[:id])
    @users = @user.followers
  end

  def search
    @results = @q.result.includes(:user)  # 検索条件にマッチした記事の情報を取得
  end

  private

  def search_article
    @q = Article.ransack(params[:q])
  end

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:user_image, :nickname, :email, :password, :birthday)
  end
end
