Rails.application.routes.draw do

  root 'blogs#index'
  
  resources :blogs do
    collection do
      post :confirm
    end
  end
  
  resources :users, only: [:new, :create, :show]
  
  resources :sessions, only: [:new, :create, :show, :destroy]
  
end
