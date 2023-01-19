Rails.application.routes.draw do
  # resources :comments
  resources :employee_tags
  resources :employees do
    resources :comments, only: [:create, :index]
  end
  resources :offices do
    resources :comments, only: [:create, :index]
  end

  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  get 'locale/:locale' => "dashboard#switch_locale", as: 'switch_locale'
  get 'say_something' => 'dashboard#say_something'
  root "dashboard#index"
end
