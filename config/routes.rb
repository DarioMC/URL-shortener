Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'urls#index'
  
  get "shortened", to: "urls#shortened", as: :shortened
  get "error", to: "urls#error", as: :error
  get "top", to: "urls#top"
  get "date", to: "urls#date"
  get "/:short_url", to: "urls#show"
  post "/urls/create", to: "urls#create"

end
