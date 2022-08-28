Rails.application.routes.draw do
  get '/users/show/:id', to:'users#show',as:'user_show'
  # ログイン、アカウント編集後、任意のページに推移させるための記述
  devise_for :users, controllers: {
          registrations: 'users/registrations'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
end
