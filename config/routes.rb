Rails.application.routes.draw do
  devise_for :users
  
  resources :wikis
  
  resources :charges, only: [:new, :create]
  
  get 'welcome' => 'welcome#index'
  
  root to: 'welcome#index'
  
end
