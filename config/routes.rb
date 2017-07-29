Rails.application.routes.draw do
  resources :weetups
  root 'weetups#index'
end
