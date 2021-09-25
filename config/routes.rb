Rails.application.routes.draw do
  root 'posts#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :posts # For convenience
  resources :posts, as: "blog_api_posts" # For active model compatibility
end
