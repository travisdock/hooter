Rails.application.routes.draw do
  resources :hoots
  resources :likes, only: [:create, :destroy]
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
