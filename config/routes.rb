Rails.application.routes.draw do
  get '/', to: 'notes#index'
  resources :notes

  get '/hello', to: 'pages#main'
  get '/about', to: 'pages#about'

  resources :users, only: [:create] do
    collection do
      get :sign_up
      get :sign_in
    end
  end

  post 'users/sign_in', to: 'sessions#create', as: 'login'
  post 'users', to: 'sessions#destroy', as: 'logout'
end
