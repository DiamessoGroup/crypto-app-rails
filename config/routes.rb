Rails.application.routes.draw do
  devise_for :users
  root 'home#index'

  get "/about", to: "home#about"

  get "/lookup", to: "home#lookupindex"

  post "/lookup", to: "home#lookup"

  get '*path', :to => redirect('./404.html')
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
