Rails.application.routes.draw do
  resources :hoots
  resources :likes, only: [:destroy]
  post '/hoots/:id/like', to: 'likes#create', as: 'hoot_like'
  get 'hooters/:id', to: 'hooters#show', as: 'hooter'
  post 'followers/:id', to: 'followers#create', as: 'follow_user'
  devise_for :users
  devise_scope :user do
    authenticated :user do
      root 'hoots#index', as: :authenticated_root
    end

    unauthenticated :user do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end
end
