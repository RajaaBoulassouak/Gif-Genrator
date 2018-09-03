Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	root 'welcome#index'
  get '/login'     => 'sessions#new'
	# create (post) action for when log in form is submitted:
	post '/login'    => 'sessions#create'
	# delete action to log out:
	delete '/logout' => 'sessions#destroy'
  	
  resources :users, only: [:show, :new, :create]
	resources :gifs, only: [:index]
	
	namespace :admin do
  	resources :categories, only: [:new, :create]
		resources :gifs
	end


  # log in page with form:
	
	
end
