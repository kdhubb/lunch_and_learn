Rails.application.routes.draw do
  namespace :api do 
    namespace :v1 do 
      resources :recipes, only: [:index]
      resources :favorites, only: [:post]
      resources :learning_resources, only: [:index]
      get "air_quality", to: "air_quality#index"
    end
  end
end
