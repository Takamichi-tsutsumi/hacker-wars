Rails.application.routes.draw do
  root "top#index"
  get "react_index" => "top#react_index"
  match 'category_change' => 'top#category_change', :via => :get
  match 'season_change/:season' => 'top#season_change', :via => :get
  match 'favorite' => 'favorite#favorite', :via => :post
  match 'mypage' => 'top#my_page', :via => :get
  post 'update_photos' => "top#update_photos"

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :organizations, only: :show
end
