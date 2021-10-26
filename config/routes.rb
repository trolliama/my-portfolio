Rails.application.routes.draw do
  resources :projects, only: [:index, :show]

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  devise_for :users
  
  get 'presentation/about', as: :about
end
