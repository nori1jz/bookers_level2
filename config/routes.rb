Rails.application.routes.draw do
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_for :users
  root to: 'homes#top'
  get  'home/about' => 'homes#about' 
  resources :books, only: [:create, :index, :show, :destroy, :update, :edit] do
     resource :favorites, only: [:create, :destroy] 
     resources :comments, only: [:create, :destroy]
  end
  resources :users , only: [:show, :edit, :update, :index] do
     resource :relationships, only: [:create, :destroy]
     get :followings, on: :member
     get :followers, on: :member
     
  end
end

