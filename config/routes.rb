Rails.application.routes.draw do
  resources :crew_members
  root "movies#index"

  resources :movies do
    resource :user_movie, only: [:update]
  end
end
