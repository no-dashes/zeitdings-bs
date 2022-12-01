Rails.application.routes.draw do
  # resources :comments
  resources :employee_tags
  resources :employees do
    resources :comments, only: [:create]
  end
  resources :offices do
    resources :comments, only: [:create]
  end
  get 'locale/:locale' => "dashboard#switch_locale", as: 'switch_locale'
  root "dashboard#index"
end
