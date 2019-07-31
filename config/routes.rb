Rails.application.routes.draw do
  resources :colors
  get 'home/index'
  resources :posts
  root to: "home#index"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
