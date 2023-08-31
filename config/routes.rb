Rails.application.routes.draw do
  post '/articles', to: 'articles#create' 
  get '/articles/new', to: 'articles#new', as: :new_article
  get '/articles', to: 'articles#index'
  get '/articles/:id', to: 'articles#show', as: :article



end
