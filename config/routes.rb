Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'users#home'

  resources :users, only: [] do
    resources :color_schemes
    resources :favorites, only: [:index, :update]
  end

  resources :color_schemes, only: [:index]
  resources :colors, only: [:create]

  get '/random' => 'color_schemes#random'
  get '/popular' => 'color_schemes#popular'

  get '/signup' => 'users#new'
  post '/signup' => 'users#create'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
  get '/auth/github/callback' => 'sessions#create_with_github'

end
