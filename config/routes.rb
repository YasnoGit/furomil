Rails.application.routes.draw do

  #顧客用 URL /customers/sign_in ...
  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  #管理者用 URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  # 下記namespace使用

  # public側ルーティング
  scope module: :public do
    root to: 'homes#top'
    get '/about', to: 'homes#about'
  # 下記1行退会警告画面用ルーティング
    get '/customers/warning', to: 'customers#warning'
  # 下記1行論理削除(退会)処理用ルーティング
    patch '/customers/withdrawal', to: 'customers#withdrawal'
    resources :facilities, only: [:show, :index]do
      # ネスト、下記1行レビュー機能ルーティング
      resources :reviews, only: [:create, :destroy]
    end
    resources :customers, only: [:show, :update, :edit]
    # 下記3行重複ルート回避
      get '/customers/information', to: 'customers#show'
      get '/customers/information/edit', to: 'customers#edit'
      patch '/customers/information', to: 'customers#update'
  end

  # admin側ルーティング
  namespace :admin do
    resources :facilities, only: [:new, :create, :show, :index, :update, :edit]
    resources :areas, only: [:index, :create, :edit, :update]
    resources :customers, only: [:show, :index, :update, :edit]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
