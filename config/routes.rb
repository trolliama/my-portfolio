Rails.application.routes.draw do
  get 'projects/search', to: "projects#search", as: :project_search

  resources :projects, only: [:index, :show]

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  devise_for :users
  
  post '', to: "presentation#create", as: :contacts

  root to: "presentation#about"

end
