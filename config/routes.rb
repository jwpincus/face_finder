Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'
  root 'welcome#index'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'


  get '/signup' => 'users#new'
  post '/users' => 'users#create'
  get '/enroll' => 'enrollments#new'
  post 'webcam/login' => 'sessions#create_webcam'
  post '/add_user' => 'authorized_users#create'
  delete '/remove_user' => 'authorized_users#delete'

  resources :enrollments, only: [:create, :new]
  resources :dashboard, only: [:index]
  resources :apps, only: [:new, :create, :show, :update, :destroy]
  namespace :api do
    namespace :v1 do
        resources :authenticate, controller: 'app_authentications'
        resources :users, only: [:index]
    end
  end
  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

end
