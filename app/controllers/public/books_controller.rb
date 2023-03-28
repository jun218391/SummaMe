class Public::BooksController < ApplicationController
    # 入力した内容はparams[:keyword]に格納して、検索ワード(書籍のタイトル)にヒットしたものを@booksに格納
    def search
        if params[:keyword]
          @books = RakutenWebService::Books::Book.search(title: params[:keyword])
        end
    end
end
