Rails.application.routes.draw do
  root "top#index"
  match 'category_change' => 'top#category_change', :via => :get
  match 'season_change/:season' => 'top#season_change', :via => :get
  match 'favorite' => 'favorite#favorite', :via => :post

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :organizations, only: :show
end
