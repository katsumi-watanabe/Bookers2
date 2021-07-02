Rails.application.routes.draw do

  get 'post_comments/create'
  get 'post_comments/destroy'
  get 'favorites/create'
  get 'favorites/destroy'
  root to: 'home#top'
  devise_for :users
  get "home/about" ,to: "home#about"
  resources :users, only: [:index, :show, :edit, :update]
  resources :books, only: [:index, :show, :edit, :create, :update, :destroy] do
    resource :favorites, only: [:create, :destroy]
    resources :post_comments, only: [:create, :destroy]
  end
end