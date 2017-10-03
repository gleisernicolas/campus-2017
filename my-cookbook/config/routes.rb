Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'home#index'
  resources :home
  resources :recipes, only: [:new, :show, :create]
  resources :cuisines , only: [:new, :show, :create]
  #get '/recipes/use/:id', to: 'recipes#use', as: 'use_recipe'
end
