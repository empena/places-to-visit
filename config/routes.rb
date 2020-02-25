Rails.application.routes.draw do
  root "places#index"
  devise_for :users

  resources :places
  # root to: "home#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
