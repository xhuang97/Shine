Rails.application.routes.draw do
  root 'home#home'
  resources :users
  resources :organizations
  resources :registries



  get 'home' => 'home#home', as: :home
  get 'about' => 'home#about', as: :about
  get 'contact' => 'home#contact', as: :contact
  get 'privacy' => 'home#privacy', as: :privacy
  get 'analytics' => 'home#analytics', as: :analytics

  # login, sign up routes
  resources :users
  resources :sessions
  get 'signup' => 'users#new', :as => :signup
  get 'login' => 'sessions#new', :as => :login
  get 'logout' => 'sessions#destroy', :as => :logout

  get 'newsletter' => 'newsletter#new', :as => :newsletter
  post 'newsletter/create' => 'newsletter#create'
  get 'newsletter/create' => 'newsletter#new'


  #get '*a', to: 'error#routing'

end
