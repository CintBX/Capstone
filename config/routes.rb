Rails.application.routes.draw do
  resources :channels
  
  resources :discussions do
  	resources :replies
  end
  
  resources :portfolios

  devise_for :users, controllers: { registrations: 'registrations' }

	get 'about', to: 'pages#about'
	
	root to: 'pages#home'
end
