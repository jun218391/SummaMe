class Public::SearchsController < ApplicationController
    before_action :authenticate_customer!

  def search
    # :range(検索モデル:ユーザー or 投稿)
    # :word(text_fieldに書き込んだ任意の文字列) ※空欄は検索不可
    @range = params[:range]
    if @range == "ユーザー"
      @customers = Customer.looks(params[:word])
    else
      @articles = Article.looks(params[:word])
    end
  end
end
