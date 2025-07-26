Rails.application.routes.draw do
  get "dashboard/index"
  # Devise routes
  devise_for :users

  # Root route
  root "dashboard#index"

  # Dashboard routes
  get "dashboard", to: "dashboard#index"

  # Resource routes
  resources :roles
  resources :gyms
  resources :membership_plans
  resources :members
  resources :membership_histories
  resources :staffs
  resources :staff_schedules
  resources :equipment
  resources :activities
  resources :bookings
  resources :attendances
  resources :payments
  resources :invoices

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
end
