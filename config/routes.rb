Rails.application.routes.draw do

  # 顧客用
  devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
  }
  
  scope module: :public do
    # ゲストログイン
    post '/guest_sign_in' => 'homes#guest'
    # 検索フォーム
    get "search" => "searchs#search"
    # 楽天API 書籍検索
    get 'books/search' => 'books#search'
    
    root to: "homes#top"
    get '/about' => "homes#about"
    
    get "customers/withdrawal_check" => "customers#withdrawal_check"
    patch "customers/withdrawal" => "customers#withdrawal"
    resources :customers, only: [:show, :edit, :update] do
      resource :relationships, only: [:create, :destroy]
      get 'followings' => 'relationships#followings', as: 'followings'
      get 'followers' => 'relationships#followers', as: 'followers'
      member do
       get :followings, :followers
       get :favorites
      end
    end
    
    resources :articles, only: [:new, :index, :show, :create, :edit, :update, :destroy] do
      resources :comments, only: [:create, :destroy]
      resource :favorites, only: [:create, :destroy]
    end
    
  end
  
  # 管理者用
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }
  
  namespace :admin do
    root to: 'homes#top'
    resources :customers, only: [:index, :show, :edit, :update]
    resources :articles, only: [:index, :show, :edit, :update, :destroy]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
