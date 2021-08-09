Rails.application.routes.draw do 
  get "/notes", to: "notes#index"

  get "/hello", to: "pages#main"
  get "/about", to: "pages#about"
  get "/users", to: "users#profile"
end
