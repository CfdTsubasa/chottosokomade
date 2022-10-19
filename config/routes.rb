Rails.application.routes.draw do
  # get 'reviews/create'
  # get 'reviews/delete'
  # get 'reviews/new'
  root 'spots#index'
  get 'spots/create'
  get '/users/show/:id', to:'users#show',as:'user_show'
  # ログイン、アカウント編集後、任意のページに推移させるための記述
  devise_for :users, controllers: {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions',
  }
  resources :spots do
    resources :likes, only: [:create, :destroy]
  end
  resources :reviews 
resources :relationships,       only: [:create, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
    get "sign_in", :to => "users/sessions#new"
    get "sign_out", :to => "users/sessions#destroy" 
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end
end
