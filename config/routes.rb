Rails.application.routes.draw do
  post '/rate' => 'rater#create', :as => 'rate'
  resources :quotes, except: %i[new]
  get '/quotes/:publication_id/new', to: 'quotes#new', as: 'quote_new'
  resources :publications
  get "post", to: 'publications#make_post', as: 'post'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get 'profile/:id', to: 'users#show', as:'profile'
  resources :users, only: %i[edit update] 
  devise_for :users
  root 'homes#index'

  get 'admin', to: 'rails_admin/main#dashboard', ass: "admin_user"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
