Rails.application.routes.draw do

  # get '/dishes', to: "dishes#show"
resources :dishes, only: [:show]

end
