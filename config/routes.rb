Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  # Defines the root path route ("/")
  # root "posts#index"
  root "home#index"
  get 'home', to: 'home#index' 
   #get 'books/:id', to: 'books#show'  (Fait la même chose que la route en dessous)
   #get 'books', to: 'books#index'  (Ajout de la route index)
   #get 'books/new', to: 'books#new'  (route new)
   #post 'books/create', to: 'books#create'  (route create)
   #get 'books/:id/edit', to: 'books#edit'  (route edit)
   #patch 'books/:id', to: 'books#update'  (route update)
   #delete 'books/:id', to: 'books#delete'  (route delete)
   resources :books, only: [:show, :index, :new, :edit, :create, :update, :destroy]
end
