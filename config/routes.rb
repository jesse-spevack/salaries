Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "welcome#index"

  get "auth/slack/callback", to: "sessions#create"
  delete "logout", to: "sessions#destroy"

  get "profile", action: :show, controller: "users"
  resources :salaries
  resources :profiles
end
