Rails.application.routes.draw do
  get 'confirmations/show'
  get 'confirmation/show'
  resources :users do
    resources :confirmations
  end
  root 'users#new'
end
