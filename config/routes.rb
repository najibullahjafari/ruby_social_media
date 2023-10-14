Rails.application.routes.draw do
  root to: 'users#index'

  get '/users', to: 'users#index'
  get '/users/:id', to: 'users#show', as: :user

  resources :users do
    resources :posts do
      resources :comments, only: [:create]
    end
  end

  post '/users/:user_id/posts', to: 'posts#create', as: :create_post
  post '/users/:user_id/posts/:post_id/comments', to: 'posts#create_comment', as: :create_comment
  post '/users/:user_id/posts/:id/like', to: 'posts#like', as: :like_user_post
end
