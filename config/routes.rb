Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace 'api' do
      namespace 'v1' do
  put 'users/confirm' => 'users#confirm'
  resources :users
  put 'update' => 'passwords#update'
  post 'forgot' => 'passwords#forgot'
  get 'login'   => 'users#login'
  get 'logout' => 'users#logout'
  post 'passwords/forgot', to: 'passwords#forgot'
  post 'passwords/reset', to: 'passwords#reset'
  get 'passwords/reset', to: 'passwords#reset'
  put 'passwords/reset', to: 'passwords#reset'
    end
  end




end
