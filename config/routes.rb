Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :registrations => 'users/registrations'
  }
  resources :users, only: [:show, :edit, :update, :index, :new] do
    resources :infos
  end

  root 'items#index'
  resources :items
end
