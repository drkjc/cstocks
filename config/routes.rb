Rails.application.routes.draw do
  root to: 'stocks#index'
  devise_for :users

  resources :portfolios do 
    resources :stocks 
  end
  
  resources :portfolios do
    resources :orders 
  end

  resources :stocks
  resources :orders

  put '/complete', to: 'stocks#complete', as: 'complete'
  get '/managers/:id/filter', to: 'stocks#filter', as: 'managers_filter'
  get '/portfolios/:portfolio_id/industry/:slug', to: 'stocks#industry', as: 'portfolio_industry'
  get '/portfolios/:id/industries', to: 'stocks#industries', as: 'industries'
  get '/search/:symbol', to: 'stocks#search', as: 'search'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
