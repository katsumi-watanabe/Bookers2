Rails.application.routes.draw do

  root to: 'homes#top'
  devise_for :users
  resources :user, only: [:index, :show, :edit, :update]
  resources :book, only: [:index, :show, :edit, :create, :update, :destroy]
end
