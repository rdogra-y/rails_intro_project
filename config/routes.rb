Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Health Check Route (For Monitoring)
  get "up" => "rails/health#show", as: :rails_health_check

  # PWA Support (If Needed)
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Application Routes
  get '/about', to: 'pages#about'  # About Page Route
  
  # Resources (CRUD routes for Countries and Cities)
  resources :countries do
    resources :cities, only: [:index, :show]  # Nested routes for Cities under Countries
  end

  # Define the root path (Homepage)
  root "countries#index"  # Set Homepage to Countries List
end
