Rails.application.routes.draw do


  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :books do
  	resources :favorites, only: [:create,:destroy]
  end

	root'root#top'
  	get '/about'=> 'root#about'

  resources :users, only: [:show, :edit, :update, :index]
end