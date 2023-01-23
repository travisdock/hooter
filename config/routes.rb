Rails.application.routes.draw do
  resources :hoots
  resources :likes, only: [:destroy]
  post '/hoots/:id/like', to: 'likes#create', as: 'hoot_like'
  post 'followers/:id', to: 'followers#create', as: 'follow_user'
  devise_for :users
  devise_scope :user do
    put 'users/update/:id', to: 'users#update', as: 'edit_user'
    get 'users/show/:id', to: 'users#show', as: 'show_user'
    authenticated :user do
      root 'hoots#index', as: :authenticated_root
    end

    unauthenticated :user do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end
end
