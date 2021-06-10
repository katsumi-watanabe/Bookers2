Rails.application.routes.draw do

  root to: 'homes#top'
  devise_for :users
  get "homes/about" ,to: "homes#about"
  resources :user, only: [:index, :show, :edit, :update]
  resources :book, only: [:index, :show, :edit, :create, :update, :destroy]
end
