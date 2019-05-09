Rails.application.routes.draw do
  resources :users, only: :show

  root 'items#index'
  resources :items
end
