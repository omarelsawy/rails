Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
root 'posts#index' , as:'home'
get 'about' => 'pages#about'
#get '/men/:name' => 'posts#men'
resources :posts do
	resources :comments
end
end
