Rails.application.routes.draw do
  get 'confirmations/show'
  get 'confirmation/show'
  resources :requests do
    collection do
      get 'access_right'
      get 'edit_right'
      get 'limit_right'
      get 'delete_right'
    end
  end

  resources :users do
    resources :confirmations
    resource :modifications
  end
  root 'users#new'
end
