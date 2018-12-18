Rails.application.routes.draw do
  root 'users#new'


  get 'confirmations/show'
  get 'confirmation/show'
  resources :requests do
    collection do
      get 'access_right'
      get 'edit_right'
      get 'limit_right'
      get 'delete_right'
      get 'limit_right_confirmation'
    end
  end

  resources :officers
  resources :sessions, only: [:new, :create, :destroy]

  get 'signup', to: 'officers#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  resources :unsubscriptions
  resources :users do
      resource :modifications
  end
end
