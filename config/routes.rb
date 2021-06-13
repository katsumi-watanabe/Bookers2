Rails.application.routes.draw do

  root to: 'home#top'
  devise_for :users
  get "home/about" ,to: "home#about"
  resources :users, only: [:index, :show, :edit, :update]
  resources :books, only: [:index, :show, :edit, :create, :update, :destroy]
end