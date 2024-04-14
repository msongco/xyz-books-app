Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :home, only: [:index]

  root "home#index"

  get 'books/search', to: 'books#search'

  # API Endpoints
  namespace :api do
    namespace :v1 do
      resources :books, only: [:index, :show], path: 'books', param: :isbn_13
      get '/convert_isbn', to: 'isbn_conversions#convert_isbn', as: :convert_isbn
    end
  end

end
