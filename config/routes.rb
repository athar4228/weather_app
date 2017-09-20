Rails.application.routes.draw do

  resources :weather_reports, only: [:new, :create]

  get '/weather_reports', to: "weather_reports#new"
  root 'weather_reports#new'
end
