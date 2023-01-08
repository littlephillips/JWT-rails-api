Rails.application.routes.draw do
resources :users, only: [:create,:index,:update, :destroy]

# post "/login", to: "users#login"
post 'login', to: 'auth#create'
end
