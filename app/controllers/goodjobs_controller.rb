class GoodjobsController < ApplicationController
  before_action :set_article

  def create
    @goodjob = Goodjob.create(user_id: current_user.id, article_id: @article.id)
    @goodjobs = Goodjob.where(article_id: params[:article_id])
    @articles = Article.all
    respond_to do |format|
      format.js {render inline: "location.reload();" }
    end
  end

  def destroy
    @goodjob = Goodjob.find_by(user_id: current_user.id, article_id: @article.id)
    @goodjob.destroy
    @goodjobs = Goodjob.where(article_id: params[:article_id])
    @articles = Article.all
    respond_to do |format|
      format.js {render inline: "location.reload();" }
    end
  end

  def set_article
    @article = Article.find(params[:article_id])
 end
end
