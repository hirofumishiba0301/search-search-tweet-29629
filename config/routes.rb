Rails.application.routes.draw do

  devise_for :users
  root 'articles#index'

  resources :users, only: [:show, :edit, :update]

  resources :articles do
    resources :goodjobs
  end

  post 'articles/attach', to: 'articles#attach'
  post '/goodjob/:article_id', to: 'goodjobs#create', as: 'like'
  delete '/goodjob/:article_id', to: 'goodjobs#destroy', as: 'unlike'
end
