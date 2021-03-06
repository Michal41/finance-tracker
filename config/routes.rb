Rails.application.routes.draw do
  resources :user_stocks, only:[:create, :destroy]
  resources :follows, only:[:create, :destroy]
  devise_for :users
  resources :users, only:[:show]
  root 'welcome#index'
  get 'my_portfolio',to: "users#my_portfolio"
  get 'my_friends',to: "users#my_friends"
  get 'search_stock', to: "stocks#search"
  get 'update_stocks', to: "stocks#update_stocks"
  get 'search_friend', to: "users#search"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
