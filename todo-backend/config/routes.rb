Rails.application.routes.draw do
  resources :project do
    resources :task
  end
end
