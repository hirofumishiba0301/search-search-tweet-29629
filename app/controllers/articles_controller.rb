class ArticlesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def index
    @articles = Article.includes(:user).order('created_at DESC')
  end

  def new
    @article = Article.new
  end

  def create
  @article = Article.new(article_params)
    if @article.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def destroy
    if @article.user_id == current_user.id
      @article.destroy
      redirect_to root_path
    else
      redirect_to article_path
    end
  end

  def edit
    redirect_to article_path unless @article.user_id == current_user.id
  end

  def update
    if @article .update(article_params)
      render :show
    else
      render :edit
    end
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:picture, :name, :text, :progress).merge(user_id: current_user.id)
  end

end