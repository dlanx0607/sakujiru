Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get "/users/:id",to: "users#show", as: "user"

  resources :posts, only: %i(new create index show destroy) do
    resources :arts, only: %i(create)
  end
  # Defines the root path route ("/")
  root "posts#index"
end
