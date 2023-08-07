Rails.application.routes.draw do
  namespace :api do 
    namespace :v1 do 
      resources :recipes, only: [:index]
      resources :favorites, only: [:post]
      resources :learning_resources, only: [:index]
      resources :users, only: [:create]
    end
  end
end
