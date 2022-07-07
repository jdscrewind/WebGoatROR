Rails.application.routes.draw do
  # Comm and Code Inj
  get 'command_inj', to: 'command_inj#index'
  # CSRF
  get 'csrf', to: 'csrf#index'
  # Deserialization
  get 'deserialize', to: 'deserialize#index'
  # Dynamic Render
  get 'dyn_render', to: 'redirect#renderm'
  # Open Redirect
  get 'open_red', to: 'redirect#index'
  get 'bad_redirect', to: 'redirect#bad'
  # SQL Inj
  get 'sql_inj', to: 'sql_inj#index'
  # SSRF
  get 'ssrf', to: 'ssrf#index'
  # XSS
  get 'xss', to: 'xss#index'
  # SQL Inj
  get 'xxe', to: 'xxe#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'home#index'
end
