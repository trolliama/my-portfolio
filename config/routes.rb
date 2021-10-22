Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  get 'presentation/about'
  get 'presentation/contact'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
