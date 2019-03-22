Rails.application.routes.draw do
  resources :astronauts, only: [:index] do
    resources :missions, only: [:index]
  end
end
