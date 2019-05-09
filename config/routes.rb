Rails.application.routes.draw do

  resources :payments
  resources :users
  resources :authentication

  root :to => 'application#index'

  get  'login', to: 'authentication#login'
  post 'logout', to: 'authentication#logout'
  post 'sso_login', to: 'authentication#sso_login'
  get  'get_login_url', to: 'users#get_login_url'

  get 'current_user', to: 'users#get_current_user'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
