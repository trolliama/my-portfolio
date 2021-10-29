Rails.application.routes.draw do
  get 'projects/search', to: "projects#search", as: :project_search

  resources :projects, only: [:index, :show]

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  devise_for :users
  
  get 'presentation/about', as: :about
  post 'presentation/about', to: "presentation#create", as: :contacts


end
