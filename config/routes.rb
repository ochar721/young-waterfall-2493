Rails.application.routes.draw do
get '/studios/:id', to: 'studios#show'


get '/movies/:id', to: 'movies#show'
get '/movies/:id', to: 'movies#edit'
post '/movies/:id', to: 'movies#update'
end
