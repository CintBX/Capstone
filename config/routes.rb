Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }

  resources :portfolios, except: [:show]
  get 'angular-items', to: 'portfolios#angular'
  get 'portfolio/:id', to: 'portfolios#show', as: 'portfolio_show'

  resources :channels  
  resources :discussions do
  	resources :replies
  end

	get 'about-me', to: 'pages#about'
	root to: 'pages#home'
end
