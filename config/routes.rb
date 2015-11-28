Rails.application.routes.draw do
  root "top#index"
  # post 'favorite/favorite'
  match 'favorite' => 'favorite#favorite', :via => :post

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :organizations, only: :show
end
