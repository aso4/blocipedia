Rails.application.routes.draw do
  resources :wikis
  resources :charges, only: [:new, :create]
  
  devise_for :users
  default_url_options :host => "example.com" # line included to pass wiki_spec.rb

  get 'about' => 'welcome#about'

  root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
