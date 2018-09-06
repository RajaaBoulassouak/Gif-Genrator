Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	
	root 'welcome#index'
  get '/login'     => 'sessions#new'
	post '/login'    => 'sessions#create'
	get '/logout' => 'sessions#destroy'
	
	resources :gifs, only: [:index]
  	
  resources :users, only: [:new, :show, :create] do
		resources :favorites, only: [:create, :destroy]
	end
	
	resources :categories, only: [:show] do 
		resources :gifs, only: [:index]
	end 
	
	namespace :admin do
  	resources :categories, except: [:edit, :update]
		resources :gifs, only: [:index, :new, :create, :destroy]
	end
		
end

