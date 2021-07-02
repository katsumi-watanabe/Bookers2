Rails.application.routes.draw do

  get 'favorites/create'
  get 'favorites/destroy'
  root to: 'home#top'
  devise_for :users
  get "home/about" ,to: "home#about"
  resources :users, only: [:index, :show, :edit, :update]
  resources :books, only: [:index, :show, :edit, :create, :update, :destroy] do
    resource :favorites, only: [:create, :destroy]
  end
end