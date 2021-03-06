Rails.application.routes.draw do
  get '/', to: 'notes#index'

  resources :notes do
    resources :comments, shallow: true, except: [:new, :edit, :update]
  end

  get '/hello', to: 'pages#main'
  get '/about', to: 'pages#about'

  resources :users, only: [:create] do
    collection do
      get :sign_up # GET /users/sign_up 註冊表單
      get :sign_in # GET /users/sign_in 登入表單
    end
  end

  post '/users/sign_in', to: 'sessions#create', as: 'login'
  
  delete '/users', to: 'sessions#destroy', as: 'logout'

  namespace :api do 
    namespace :v1 do
      resources :notes, only: [] do
        member do 
          post :favorite
        end
      end  
    end
  end    


end
