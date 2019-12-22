Rails.application.routes.draw do
  get 'welcome/index'

  get 'login', to: 'users#login'
  post 'loginCheck', to: 'users#checkCredentials'

  resources :users do
    resources :articles
  end

  resources :articles do
    resources :comments
  end

  root 'welcome#index'
end
