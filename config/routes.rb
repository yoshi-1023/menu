Rails.application.routes.draw do
  root to: "menus#index"
  resources :menus, only: :index
end
