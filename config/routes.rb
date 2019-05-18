Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :registrations => 'users/registrations'
  }
  resources :users, only: [:show, :edit, :update, :index, :new] do
    resources :infos
    resources :card_infos, only: [:new, :show] do
      collection do
        post 'show', to: 'card_infos#show'
        post 'pay', to: 'card_infos#pay'
        post 'delete', to: 'card_infos#delete'
      end
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'items#index'
  resources :items
  resources :transactions
end
