Rails.application.routes.draw do
  devise_for :users

  get  '/metros/favorites' => 'metros#favorites'
  post '/metros/:station_code/favorite' => 'metros#favorite'

  resources :buses, only: [:index]

  root to: "metros#index"
end
