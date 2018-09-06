Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	
	root 'welcome#index'
  get '/login'     => 'sessions#new'
	post '/login'    => 'sessions#create'
	get '/logout' => 'sessions#destroy'
  	
  resources :users do 
		resources :favorites
	end
	
	resources :categories do 
		resources :gifs
	end 
	
	resources :gifs
	
	namespace :admin do
  	resources :categories
		resources :gifs
	end
		
end
