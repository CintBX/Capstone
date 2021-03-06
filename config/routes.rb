Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations', sessions: 'sessions', passwords: 'passwords' }, path: '', path_names: { sign_in: "login", sign_out: "logout", sign_up: "register" }

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
