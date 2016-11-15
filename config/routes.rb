Rails.application.routes.draw do
  
  get 'users/premium_to_standard'

  resources :wikis
  resources :charges

  devise_for :users
  resources :users, only: [:show, :index] do
    post 'premium_to_standard' => 'users#premium_to_standard', as: :premium_to_standard
  end

  default_url_options :host => "example.com" # line included to pass wiki_spec.rb

  root 'welcome#index'
end
