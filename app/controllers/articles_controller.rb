class ArticlesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :search_article, only: [:index, :search]

  def index
    @articles = Article.includes(:user).order('created_at DESC')
    set_article_column
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

  def attach
    attachment = Attachment.create! image: params[:image]
    render json: { filename: url_for(attachment.image) }
  end

  def search
    @results = @q.result.includes(:user)  # 検索条件にマッチした記事の情報を取得
  end

  private

  def search_article
    @q = Article.ransack(params[:q])
  end

  def set_article_column
    @article_name = Article.select("name").distinct  # 重複なくnameカラムのデータを取り出す
  end


  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:name, :text, :progress).merge(user_id: current_user.id)
  end

end