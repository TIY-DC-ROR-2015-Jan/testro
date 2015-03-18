Rails.application.routes.draw do
  devise_for :users

  get  '/metros/favorites' => 'metros#favorites'
  post '/metros/:station_code/favorite' => 'metros#favorite'

  resources :buses, only: [:index] do
    member do
      post :favorite
      delete :unfavorite
    end
  end

  root to: "metros#index"
end
