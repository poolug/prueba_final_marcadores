Rails.application.routes.draw do
  resources :types
  resources :categories
  resources :marks

  root to: "marks#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
