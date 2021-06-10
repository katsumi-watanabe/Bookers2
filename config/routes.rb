Rails.application.routes.draw do

  root to: 'homes#top'
  devise_for :users
  get "homes/about" ,to: "homes#about"
  resources :users, only: [:index, :show, :edit, :update]
  resources :books, only: [:index, :show, :edit, :create, :update, :destroy]
end
