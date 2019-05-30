Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    omniauth_callbacks: "users/omniauth_callbacks"
  }

  resources :users, only: [:show, :edit, :update, :index, :new] do
    resources :infos
    resources :card_infos, only: [:new, :show, :destroy] do
      collection do
        post 'show', to: 'card_infos#show'
        post 'pay', to: 'card_infos#pay'
      end
    end
  end

  root 'items#index'
  resources :items do
    resources :transactions, only: [:new, :order_status] do
      collection do
        get 'new', to: 'transactions#new'
        get 'pay', to: 'transactions#pay'
        get 'done', to: 'transactions#done'
        get 'order_status', to: 'transactions#order_status'
        get 'order_status_ship', to: 'transactions#order_status_ship'
        get 'order_status_receive', to: 'transactions#order_status_receive'

      end
    end
  end
  # 仮置き
  resources :listings, only: [:index] do
    collection do
      get 'in_progress', to: 'listings#in_progress'
      get 'completed', to: 'listings#completed'
      get 'purchase', to: 'listings#purchase'
      get 'purchased', to: 'listings#purchased'
    end
  end



  get 'logout', to: 'users#logout_form'
end
