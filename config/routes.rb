Rails.application.routes.draw do
  root "top#index"
  match 'category_change' => 'top#category_change', :via => :get
  match 'season_change/:season' => 'top#season_change', :via => :get
  match 'favorite' => 'favorite#favorite', :via => :post
  match 'mypage' => 'top#my_page', :via => :get
  post 'update_photos' => "top#update_photos"

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :organizations, only: :show

  get "react_index" => "top#react_index"
  namespace :api, format: 'json' do
    get "photo_data.json" => "api#photo_data"
  end

  get "photo_data" => "api#photo_data", format: 'json'

end
