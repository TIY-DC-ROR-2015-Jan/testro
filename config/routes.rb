Rails.application.routes.draw do
  devise_for :users

  post '/metros/:station_code/favorite' => 'metros#favorite'

  root to: "metros#index"
end
