class Public::ArticlesController < ApplicationController
  def new
    @article = Article.new
  end
  
  def index
    # 公開された記事のみ表示
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
      flash[:notice] = "投稿に成功しました"
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
    params.require(:article).permit(:title, :content, :todo, :is_published_flag)
  end

end
