Rails.application.routes.draw do
  # Health Check Route (For Monitoring)
  get "up" => "rails/health#show", as: :rails_health_check

  # PWA Support (If Needed)
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Application Routes
  get '/about', to: 'pages#about'  # About Page Route

  # Resources (CRUD routes for Countries and Cities)
  resources :countries do
    resources :cities, only: [:index, :show]  # Nested Cities under Countries
  end

  # Add a standalone cities route to list all cities
  resources :cities, only: [:index, :show]

  # Define the root path (Homepage)
  root "countries#index"
end
