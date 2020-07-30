Rails.application.routes.draw do
  root 'welcome#index'
  
  get 'welcome/index'

  # get 'signup', to: 'users#new', as: 
  # get 'logout', to: 'sessions#destroy', as: 'l'signup'
  # get 'login', to: 'sessions#new', as: 'login'ogout'
  get :logged_in, to: 'sessions#logged_in'
  delete :logout, to: 'sessions#logout'

  resources :users
  resources :registrations, only: :create
  resources :sessions, only: [:new, :create, :destory]
  
  resources :articles do
    resources :comments
  end
end
