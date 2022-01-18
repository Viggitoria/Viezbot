Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root 'chatwindow#index'
  get '/chatwindow', to: 'chatwindow#index'
  get '/next/:value', to: 'chatwindow#next'
  get '/next', to: 'chatwindow#next'
  # Defines the root path route ("/")
  # root "articles#index"
end
