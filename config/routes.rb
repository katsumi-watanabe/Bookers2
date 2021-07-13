Rails.application.routes.draw do

  devise_for :users
  root to: 'home#top'
  get "search", to: "search#search"
  get "home/about" ,to: "home#about"
  resources :users, only: [:index, :show, :edit, :update] do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
    get "search", to: "users#search"
  end
  resources :messages, only: [:create]
  resources :rooms, only: [:create,:show]

  resources :books, only: [:index, :show, :edit, :create, :update, :destroy] do
    resource :favorites, only: [:create, :destroy]
    resources :post_comments, only: [:create, :destroy]
  end
end