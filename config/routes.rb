Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  devise_for :users
  root 'pages#index'
 	get 'pages/:id/show' => 'pages#show', as: 'show'
 	resources :dishes do
 		resources :cart_items, only: :create
 	end
 	delete 'cart_items/:id/destroy' => 'cart_items#destroy', as: 'destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
