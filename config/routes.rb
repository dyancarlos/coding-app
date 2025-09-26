Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  resource :weathers, only: %i[new create]

  root "weathers#new"
end
