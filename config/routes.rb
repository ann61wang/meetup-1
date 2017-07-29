Rails.application.routes.draw do
  devise_for :users
  resources :weetups do
    resources :comments
  end
  root 'weetups#index'
end
