Rails.application.routes.draw do
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_for :users
  root to: 'homes#top'
  get  '/about' => 'homes#about' 
  resources :post_books, only: [ :create, :index, :show, :destroy, :update, :edit]
  resources :users, only: [:show, :edit, :update, :index]
  
end
