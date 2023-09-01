Rails.application.routes.draw do
  delete '/articles/:id', to: 'articles#destroy'
  patch '/articles/:id', to: 'articles#update'
  post '/articles', to: 'articles#create' 
  get '/articles/new', to: 'articles#new', as: :new_article
  get '/articles', to: 'articles#index'
  get '/articles/:id', to: 'articles#show', as: :article
  get '/articles/:id/edit', to: 'articles#edit', as: :edit_article 



end
