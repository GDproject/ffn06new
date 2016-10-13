Rails.application.routes.draw do
  root "news#index"

  get "/new_session", to: "sessions#new"
  post "/new_session", to: "sessions#create"
  delete "/delete_session", to: "sessions#destroy"
  resources :users , except: [:index, :destroy]
  resources :sessions, only: [:new, :create, :destroy]
  resources :clubs, only: [:index, :show]
  resources :players, only: [:index, :show]
  resources :scores, only: [:index, :show]
  resources :rates, only: [:index, :show]
  resources :category_news, only: [:index, :show]
  resources :news, only: [:index, :show]
  resources :matches, only: [:index, :show]
  resources :bets
  namespace :admin do
    resources :users, :players, :rates, :clubs, :category_news, :scores, :news
    resources :matches, :category_match_rates, :bets
  end
  get "admin", to: "admin/welcome#home"
  delete "/delete_admin", to: "admin/users#destroy"
end
