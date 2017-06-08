Rails.application.routes.draw do
  resources :swits do
  	resources :comments
  end
  resources :users
  resources :login
  resources :profile
  resources :home

  delete "logout" => "home#destroy"

  # match '/users/create' => 'users#create', :as => :create_user

  # create_user(@user)

  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
