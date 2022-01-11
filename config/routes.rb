Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  namespace :html do
    resources :projects, only: [:index]
  end

  namespace :decorator do
    resources :projects, only: [:index]
  end
end
