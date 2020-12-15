Rails.application.routes.draw do
  get 'users/show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "welcome#index"

  get "auth/slack/callback", to: "sessions#create"
  delete "logout", to: "sessions#destroy"

  get "profile", to: "users#show"
end
