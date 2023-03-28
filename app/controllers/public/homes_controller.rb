class Public::HomesController < ApplicationController
  # ゲストログイン
  def guest
    customer          = Customer.new(customer_params)
    customer.name     = "ゲストユーザー"
    # 15,10文字のランダムな英数字を自動で生成
    customer.email    = SecureRandom.alphanumeric(15) + "@email.com"
    customer.password = SecureRandom.alphanumeric(10)
    customer.save
    sign_in customer
    redirect_to root_path
  end
  
  def top
    @articles = Article.published.order('id DESC').limit(4)
  end

  def about
  end
  
  # ゲストログイン用
  private

  def customer_params
    params.permit(:name, :email, :password)
  end
  
end
