Rails.application.routes.draw do
  root "tasks#index"
  delete "tasks/:id", to: "tasks#destroy"
  patch '/tasks/save', to: 'tasks#save', as: "save_tasks"

  resources :tasks


  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

end
