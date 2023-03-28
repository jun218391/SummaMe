class Admin::ArticlesController < ApplicationController
  before_action :authenticate_admin!
  def index
    @articles = Article.all.page(params[:page]).per(10)
  end

  def show
    @article = Article.find(params[:id])
  end

  def edit
    @article = Article.find(params[:id])
  end
  
  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to admin_article_path(@article), notice: "情報を更新しました"
    else
      render :edit
    end
  end
  
  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
  end
  
  private
  
  def article_params
    params.require(:article).permit(:title, :content, :todo, :is_published_flag)
  end
end
