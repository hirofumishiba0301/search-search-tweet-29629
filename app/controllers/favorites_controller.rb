class FavoritesController < ApplicationController
  before_action :set_article

  def index
    @articles = Article.includes(:user).order('created_at DESC')
    @favorites = Favorite.includes(:user)
  end

  def create
    @favorite = Favorite.create(user_id: current_user.id, article_id: @article.id)
    @favorites = Favorite.where(article_id: params[:article_id])
    @articles = Article.all
    respond_to do |format|
      format.js {render inline: "location.reload();" }
    end
  end

  def destroy
    @favorite = Favorite.find_by(user_id: current_user.id, article_id: @article.id)
    @favorite.destroy
    @favorites = Favorite.where(article_id: params[:article_id])
    @articles = Article.all
    respond_to do |format|
      format.js {render inline: "location.reload();" }
    end
  end

  def set_article
    @article = Article.find(params[:article_id])
 end
end
