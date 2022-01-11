Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  namespace :service do
    resources :projects, only: [:index]

    namespace :api do 
      namespace :v1 do
        resources :projects, only: [:index]
      end
    end
  end

  namespace :decorator do
    resources :projects, only: [:index]

    namespace :api do 
      namespace :v1 do
        resources :projects, only: [:index]
      end
    end
  end
  root to: 'decorator/projects#index'
end
