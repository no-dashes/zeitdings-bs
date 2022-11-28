Rails.application.routes.draw do
  resources :comments
  resources :employee_tags
  resources :employees do
    resources :comments
  end


  resources :offices
  root "dashboard#index"
end


/employees/12/comments/5


