Rails.application.routes.draw do
  devise_for :users
  get "up" => "rails/health#show", as: :rails_health_check

  root to: "home#index"
  get "tasks", to: "task#index", as: :tasks
  post "tasks/create", to: "task#create", as: :tasks_create
  delete "tasks/:id", to: "task#destroy", as: :tasks_destroy
end
