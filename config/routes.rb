Rails.application.routes.draw do
  root to: 'homes#top'
  devise_for :users
  
  get "home/about" => 'homes#about'
  
  resources :books, only: [:create, :index, :show, :edit, :destroy, :update]
  resources :users, only: [:edit, :show, :update, :index]
end
