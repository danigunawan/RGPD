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
    #post "unsubscriptions/new"

  resources :users do
      resource :modifications
  end
    get 'cemetary', to: "users#cemetary", as: 'cemetary'
  get "users/archive/:id", to: "users#archive", as: :users_archive
end
