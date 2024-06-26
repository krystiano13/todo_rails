Rails.application.routes.draw do
  devise_for :users
  get "up" => "rails/health#show", as: :rails_health_check

  root to: "home#index"
  get "tasks", to: "task#index", as: :tasks
  post "tasks/create", to: "task#create", as: :tasks_create
  patch "tasks/edit/:id", to: "task#update", as: :tasks_update
  patch "tasks/done/:id", to: "task#done", as: :tasks_done
  patch "tasks/undone/:id", to: "task#undone", as: :tasks_undone
  delete "tasks/:id", to: "task#destroy", as: :tasks_destroy
end
