Rails.application.routes.draw do
  devise_for :users
  resources :weetups do
    resources :comments
  end

  namespace :api do
    namespace :v1 do
      resources :users, only: [:index, :create, :show, :update, :destroy]
      resources :sessions, only: [:create]
      resources :weetups, only: [:index]
    end
  end

  root 'weetups#index'
end
