Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: [:show]
      resources :samples, only: [:create]
      resources :libraries, only: [:create, :update, :destroy]
      resources :folders, only: [:create, :update, :destroy]
      resources :tags, only: [:create, :update, :destroy]
      # auth
      post '/login', to: 'sessions#create'
      post '/signup', to: 'users#create'
      get '/current_user', to: 'sessions#show'
      # uniq actions
      put '/samples/download', to: 'samples#download'
      patch '/samples', to: 'samples#update'
      delete '/samples', to: 'samples#destroy'
      get '/search/users/exact/:query', to: 'users#exact_search'
      mount ActionCable.server => '/cable'
    end
  end
end
