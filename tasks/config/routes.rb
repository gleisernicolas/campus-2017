Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # get '/', to: 'tasks#index', as: 'home'
  root to: 'tasks#index'

  resources :tasks
end
