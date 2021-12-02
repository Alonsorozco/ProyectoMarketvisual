Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get 'profile/:id', to: 'users#show', as:'profile'
  resources :users, only: %i[edit update] 
  devise_for :users
  root 'homes#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
