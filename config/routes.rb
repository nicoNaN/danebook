Rails.application.routes.draw do
  resources :photos

  resources :likes

  resources :comments

  resources :friendships, only: [:create, :destroy]

  resources :posts
  resources :posts do
    resources :comments
  end

  resources :users do
    resource :profile
    resource :timeline
    resource :friends
    resource :newsfeed
    resources :photos
  end
  resource :session, only: [:new, :create, :destroy]
  get "login" => "sessions#new"
  delete "logout" => "sessions#destroy"

  post 'search' => 'users#search'

  root 'users#new'
  StaticPagesController.action_methods.each do |action|
    get "/#{action}", to: "static_pages##{action}", as: "#{action}_page"
  end
end
