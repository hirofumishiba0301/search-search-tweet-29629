Rails.application.routes.draw do

  devise_for :users
  root 'articles#index'

  resources :relationships

  resources :users, only: [:show, :edit, :update] do
    resources :favorites
    member do
      get :follow, :followers
    end
  end

  resources :articles do
    resources :goodjobs
  end
  post '/relationship/:follow_id', to: 'relationships#create', as: 'follow'
  post '/favorite/:article_id', to: 'favorites#create', as: 'love'
  delete '/favorite/:article_id', to: 'favorites#destroy', as: 'unlove'
  post 'articles/attach', to: 'articles#attach'
  post '/goodjob/:article_id', to: 'goodjobs#create', as: 'like'
  delete '/goodjob/:article_id', to: 'goodjobs#destroy', as: 'unlike'
end
