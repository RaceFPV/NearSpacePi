Rails.application.routes.draw do
  root 'home#index'
  match '/', to: 'home#index', via: 'get', as: 'home'
  match 'stream', to: 'stream#index', via: 'get', as: 'stream'
  match 'about', to: 'home#about', via: 'get', as: 'about'
  match 'stream/:name', to: 'stream#show', via: 'get', as: 'custom_image'
  match 'map', to: 'map#index', via: 'get', as: 'map'
  match 'gyro', to: 'gyro#index', via: 'get', as: 'gyro'
end
