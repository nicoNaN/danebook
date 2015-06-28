Rails.application.routes.draw do
  resources :posts
  resources :posts do
    resources :comments
  end

  resources :users do
    resource :profile
    resource :timeline
  end
  resource :session, only: [:new, :create, :destroy]
  get "login" => "sessions#new"
  delete "logout" => "sessions#destroy"

  root 'users#new'
  StaticPagesController.action_methods.each do |action|
    get "/#{action}", to: "static_pages##{action}", as: "#{action}_page"
  end
end
