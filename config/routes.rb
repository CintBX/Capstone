Rails.application.routes.draw do
  resources :discussions do
  	resources :replies
  end

	root to: 'pages#home'

  get 'about', to: 'pages#about'

  devise_for :users, controllers: { registrations: 'registrations' }

  resources :portfolios
end
