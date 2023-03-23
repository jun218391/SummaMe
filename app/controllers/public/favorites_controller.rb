class Public::FavoritesController < ApplicationController
  before_action :authenticate_customer!
  # 非同期通信で実装
  def create
    @article = Article.find(params[:article_id])
    favorite = current_customer.favorites.new(article_id: @article.id)
    favorite.save
    # redirect_to article_path(article)
  end

  def destroy
    @article = Article.find(params[:article_id])
    favorite = current_customer.favorites.find_by(article_id: @article.id)
    favorite.destroy
    # redirect_to article_path(article)
  end
end
