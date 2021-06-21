Rails.application.routes.draw do
  #root 'users/index' =>"users#index"
  #get 'home/userinfo' => 'home#userinfo', as: 'userinfo'
  namespace :admin do
    get 'index' => 'users#index', as: 'index'
    resources :users
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
