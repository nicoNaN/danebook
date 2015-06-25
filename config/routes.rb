Rails.application.routes.draw do
  resources :users

  root 'users#new'
  StaticPagesController.action_methods.each do |action|
    get "/#{action}", to: "static_pages##{action}", as: "#{action}_page"
  end
end
