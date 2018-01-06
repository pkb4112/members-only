Rails.application.routes.draw do
 

  get 'static_pages/home'

# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

resources :users, :posts

root 'static_pages#home'

get '/login', to: 'sessions#new'
post '/login', to: 'sessions#create'
delete '/logout', to: 'sessions#destroy'

 


end
