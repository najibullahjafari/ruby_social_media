Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    authenticated :user do
      root to: 'users#index', as: :authenticated_root
    end

    unauthenticated do
      root to: 'devise/sessions#new', as: :unauthenticated_root
    end
  end

  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show]
  end

  resources :posts do
    resources :comments, only: [:create, :destroy] # Add :destroy action
    resources :likes, only: [:create]
  end

  namespace :api, defaults: { format: 'json' } do
    resources :users, only: [] do
      resources :posts, only: [:index] # API endpoint to list all posts for a user
    end

    resources :posts, only: [] do
      resources :comments, only: [:index, :create] # API endpoint to list comments for a post and add comments
    end
  end
end
