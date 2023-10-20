Rails.application.routes.draw do
  root to: 'users#index'

  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show]
  end

  resources :posts do
    resources :comments, only: [:create]
    resources :likes, only: [:create]
  end
end
