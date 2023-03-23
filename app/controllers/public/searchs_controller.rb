class Public::SearchsController < ApplicationController
    before_action :authenticate_customer!

  def search
    @range = params[:range]
    # :range(Customer or Article)

    if @range == "Customer" #検索モデルがCustomerなら
      @customers = Customer.looks(params[:search], params[:word])
    else                    #検索モデルがArticleなら
      @articles = Article.looks(params[:search], params[:word])
    end
    # :search(完全一致、前方一致、後方一致、部分一致)
    # :word(text_fieldに書き込んだ任意の文字列)
  end
end
