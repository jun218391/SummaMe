class Public::BooksController < ApplicationController
    # 入力した内容はparams[:keyword]に格納して検索ワードにヒットしたものを@booksに格納
    # 本の検索で絞っています
    def search
        if params[:keyword]
          @books = RakutenWebService::Books::Book.search(title: params[:keyword])
        end
    end
end
