Rails.application.routes.draw do

  devise_for :users
  root 'articles#index'

  resources :users, only: [:show, :edit, :update]

  resources :articles
  post 'articles/attach', to: 'articles#attach'
end
