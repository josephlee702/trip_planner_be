Rails.application.routes.draw do
  mount DeviseTokenAuth::Engine => '/auth'
  
  get "up" => "rails/health#show", as: :rails_health_check
end
