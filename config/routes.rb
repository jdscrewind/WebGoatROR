Rails.application.routes.draw do
  # Comm and Code Inj
  get 'command_inj', to: 'command_inj#index'
  # SQL Inj
  get 'sql_inj', to: 'sql_inj#index'
  # XSS
  get 'xss', to: 'xss#index'
  # CSRF
  get 'csrf', to: 'csrf#index'
  # Open Redirect
  get 'open_red', to: 'redirect#index'
  get 'bad_redirect', to: 'redirect#bad'
  # Dynamic Render
  get 'dyn_render', to: 'redirect#renderm'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'home#index'
end
