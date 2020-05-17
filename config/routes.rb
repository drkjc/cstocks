Rails.application.routes.draw do
  root to: 'stocks#index'
  devise_for :users
  resources :portfolios
  get '/my_portfolios', to: 'portfolios#list', as: 'list'
  resources :stocks
  get '/industry/id', to: 'stocks#industry', as: 'industry'
  get '/industries', to: 'stocks#industries', as: 'industries'
  get '/search/:symbol', to: 'stocks#search', as: 'search'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
