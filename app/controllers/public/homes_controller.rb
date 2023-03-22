class Public::HomesController < ApplicationController
  def top
    @articles = Article.order('id DESC').limit(4)
  end

  def about
  end
end
