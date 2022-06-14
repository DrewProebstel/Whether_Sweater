Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      get 'forecast', to: 'weather#index'
      get 'backgrounds', to: 'images#index'
      get 'book-search', to: 'books#index'
      post 'users', to: 'users#create'
    end
  end
end
