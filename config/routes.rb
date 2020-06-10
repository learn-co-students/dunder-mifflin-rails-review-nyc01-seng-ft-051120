Rails.application.routes.draw do
  resources :dogs
  resources :employees
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :dogs, only: [:index, :show]
  resources :employees, only: [:index, :show, :new, :create, :edit, :update]
end
