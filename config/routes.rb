Rails.application.routes.draw do
  devise_for :users
  root to: 'categories#index'
  resources :categories do
    post 'comments', to: 'comments#create'
  end
  resources :posts do
    post 'comments', to: 'comments#create'
  end

end
