Rails.application.routes.draw do
  root "movies#index"

  resources :movies do
    resource :user_movie, only: [:update]
  end
end
