class Public::ArticlesController < ApplicationController
  before_action :ensure_customer, only: [:edit, :update, :destroy]
  
  def new
    @article = Article.new
    @image_url = params[:image_url]
    @article.title = params[:title]
  end
  
  def index
    # 公開設定されている記事のみ表示
    @articles = Article.published
  end

  def show
    @article = Article.find(params[:id])
    @comment = Comment.new
  end
  
  def create
    @article = Article.new(article_params)
    @article.customer_id = current_customer.id
    if @article.save
      redirect_to articles_path
    else
      render :new
    end
  end
  
  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to article_path(@article)
    else
      render "edit"
    end
  end
  
  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
  end
  
  def edit
    @article = Article.find(params[:id])
  end
  
  private
  
  def article_params
     params.require(:article).permit(:title, :content, :todo, :book_image, :is_published_flag, :image_url)
  end
  
  def ensure_customer
    @articles = current_customer.articles
    @article = @articles.find_by(id: params[:id])
    redirect_to root_path unless @article
  end

end

