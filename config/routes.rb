Rails.application.routes.draw do
  
  get "up" => "rails/health#show", as: :rails_health_check
  namespace :api do
    namespace :v1 do
      mount_devise_token_auth_for 'User', at: "auth"
      resources :users, only: [:index, :show]
      resources :trips do
        resources :itineraries
      end
    end
  end
end
