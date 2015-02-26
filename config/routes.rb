Rails.application.routes.draw do
  root 'home#index'
  match '/', to: 'home#index', via: 'get', as: 'home'
  match 'stream', to: 'stream#index', via: 'get', as: 'stream'
  match 'about', to: 'home#about', via: 'get', as: 'about'
end
