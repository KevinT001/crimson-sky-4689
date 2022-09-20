Rails.application.routes.draw do

  get '/dishes/:id', to: "dishes#show"
  # resources :dishes, only: [:show]

end
