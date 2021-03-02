Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace 'api' do
      namespace 'v1' do
  put 'users/confirm' => 'users#confirm'
  get 'login'   => 'users#login'
  get 'logout' => 'users#logout'
  post 'passwords/forgot', to: 'passwords#forgot'
  post 'passwords/reset', to: 'passwords#reset'
  resources :users, only: %i[index create update destroy]
  resources :consultation, only: %i[index create show update destroy]
  resources :comments, only: %i[index create update destroy]

  end
 end
end
