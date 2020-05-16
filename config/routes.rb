Rails.application.routes.draw do
  resources :stocks
  get '/search/:symbol', to: 'stocks#search', as: 'search'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
