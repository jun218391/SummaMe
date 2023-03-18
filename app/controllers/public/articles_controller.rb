class Public::ArticlesController < ApplicationController
  def new
    @article = Article.new
  end
  
  def index
    @articles = Article.all
    # @article.customer_id = current_customer.id
  end

  def show
    @article = Article.find(params[:id])
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
  end
  
  def destroy
  end
  
  def edit
  end
  
  private
  
  def article_params
    params.require(:article).permit(:title, :content, :todo)
  end

end
