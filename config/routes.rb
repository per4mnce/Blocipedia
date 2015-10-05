Rails.application.routes.draw do
  devise_for :users
  
  resources :wikis
  
  get 'welcome' => 'welcome#index'
  
  root to: 'welcome#index'
  
end
