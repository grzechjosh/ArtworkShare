Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users do 
    resources :artworks, only: [:create, :new, :update, :index]
    resources :artwork_shares, only: [:index]
    resources :comments, only: [:index]
  end
  resources :artworks do 
    resources :artwork_shares, only: [:index]
    resources :comments, only: [:index]
  end
  resources :artwork_shares
  resources :artworks, only: [:destroy, :index, :show]
  resources :comments
end
