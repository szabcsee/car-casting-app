Rails.application.routes.draw do
  resources :vehicle_models
  resources :vehicle_brands
  resources :vehicles
  resources :vehicle_extras
  resources :vehicle_categories
  resources :vehicle_conditions
  resources :vehicle_fuels
  resources :vehicle_bodies
  resources :vehicle_types
  resources :user_profiles
  resources :settings
  devise_for :users, controllers: { sessions: 'users/sessions' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
  # Miscellaneous
  get 'miscellaneous/login',
      to: 'miscellaneous#login',
      as: :miscellaneous_login
  get 'register',
      to: 'miscellaneous#register',
      as: :miscellaneous_register
  get 'miscellaneous/forgot_password',
      to: 'miscellaneous#forgot_password',
      as: :miscellaneous_forgot_password
  get 'miscellaneous/locked_screen',
      to: 'miscellaneous#locked_screen',
      as: :miscellaneous_locked_screen
  get 'miscellaneous/error_page',
      to: 'miscellaneous#error_page',
      as: :error_page
  get 'my_vehicles/:id',
      to: 'vehicles#find_by_user',
      as: :my_vehicle

  get 'vehicle_models_by_brand',
      to: 'vehicle_models#find_by_brand',
      as: :vehicle_models_by_brand
  # AJAX
  get 'ajax/email_compose', to: 'ajax#email_compose', as: :ajax_email_compose
  get 'ajax/email_list', to: 'ajax#email_list', as: :ajax_email_list
  get 'ajax/email_opened', to: 'ajax#email_opened', as: :ajax_email_opened
  get 'ajax/email_reply', to: 'ajax#email_reply', as: :ajax_email_reply
  get 'ajax/demo_widget', to: 'ajax#demo_widget', as: :ajax_demo_widget
  get 'ajax/data_list.json', to: 'ajax#data_list', as: :ajax_data_list
  get 'ajax/notify_mail', to: 'ajax#notify_mail', as: :ajax_notify_mail
  get 'ajax/notify_notifications',
      to: 'ajax#notify_notifications',
      as: :ajax_notify_notifications
  get 'ajax/notify_tasks', to: 'ajax#notify_tasks', as: :ajax_notify_tasks

  # Misc methods
  get '/home/set_locale', to: 'home#set_locale', as: :home_set_locale

  # CK editor
  mount Ckeditor::Engine => '/ckeditor'
end
