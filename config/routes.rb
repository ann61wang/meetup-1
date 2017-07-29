Rails.application.routes.draw do
  devise_for :users
  resources :weetups
  root 'weetups#index'
end
