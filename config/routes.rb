Rails.application.routes.draw do

  devise_for :users
  root 'articles#index'

  resources :users, only: [:show, :edit, :update] do
    resources :favorites
  end

  resources :articles do
    resources :goodjobs
  end
  post '/favorite/:article_id', to: 'favorites#create', as: 'love'
  delete '/favorite/:article_id', to: 'favorites#destroy', as: 'unlove'
  post 'articles/attach', to: 'articles#attach'
  post '/goodjob/:article_id', to: 'goodjobs#create', as: 'like'
  delete '/goodjob/:article_id', to: 'goodjobs#destroy', as: 'unlike'
end
