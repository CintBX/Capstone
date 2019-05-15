Rails.application.routes.draw do
  get 'about', to: 'pages#about'

  devise_for :users

  resources :portfolios

  root to: 'pages#home'  
end
