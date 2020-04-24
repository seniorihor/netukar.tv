Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :movies, only: :index
      resources :seasons, only: %i[index show] do
        resources :episodes, only: %i[index show]
      end
      resources :movies_and_seasons, only: :index
      resources :purchases, only: %i[index create]
      resources :users, only: %i[index create] do
        resources :libraries, only: :index
      end
    end
  end
end
