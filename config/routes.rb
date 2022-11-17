Rails.application.routes.draw do
  resources "employees"
  root "dashboard#index"
end
