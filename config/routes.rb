Rails.application.routes.draw do
  devise_for :users
  get "up" => "rails/health#show", as: :rails_health_check

  root to: "home#index"
  get "tasks", to: "task#index", as: :tasks
end
