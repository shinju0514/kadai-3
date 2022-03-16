Rails.application.routes.draw do
  devise_for :users
  get "homes/top" => "homes#top", as: "homes"
  root to: "homes#top"
  resources :books, only:[:new, :index, :show, :destroy, :create, :edit, :update]
  resources :users, only:[:edit, :show ,:index]
  get "homes/about" => "homes#about", as: "about"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
