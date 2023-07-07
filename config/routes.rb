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

  # public側ルーティング
  scope module: :public do
    root to: 'homes#top'
    get '/about', to: 'homes#about'
    resources :facilities, only: [:show, :index]
    resources :customers, only: [:show, :update, :edit]
  end

  # admin側ルーティング
  namespace :admin do
    resources :facilities, only: [:new, :create, :show, :index, :update, :edit]
    resources :areas, only: [:index, :create, :edit, :update]
    resources :customers, only: [:show, :index, :update, :edit]
  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
