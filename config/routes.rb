Rails.application.routes.draw do
  get 'stream/index'

  get 'home/index'
  root 'home#index'

end
