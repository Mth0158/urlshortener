Rails.application.routes.draw do
  root to: 'pages#home'
  get 'home', to: 'pages#home'
  get 'newurl', to: 'pages#newurl', as: 'newurl'

  post 'urls', to: "urls#create"
  get ':id', to: "urls#show", as: 'url'
end
