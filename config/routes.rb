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
    resources :transactions, only: [:new] do
      collection do
        get 'new', to: 'transactions#new'
        get 'pay', to: 'transactions#pay'
        get 'done', to: 'transactions#done'
      end
    end
  end
  # 仮置き
  resources :listings, only: [:index] do
    collection do
      get 'in_progress', to: 'listings#in_progress'
      get 'completed', to: 'listings#completed'
    end

  end
  get 'logout' => 'users#logout_form'
end
