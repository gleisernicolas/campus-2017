Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'home#index'
  get '/recipes/search/', to: 'recipes#search', as: 'search_recipe'
  resources :recipes
  resources :cuisines , only: [:new, :show, :create]
  resources :recipe_types
  #get '/recipes/use/:id', to: 'recipes#use', as: 'use_recipe'
end
