Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: [:show]
      resources :samples, only: [:create]
      # auth
      post '/login', to: 'sessions#create'
      post '/signup', to: 'users#create'
      get '/current_user', to: 'sessions#show'
      # uniq actions
      put '/samples/download', to: 'samples#download'
    end
  end
end
