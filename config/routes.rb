Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :distances, only: [:index, :create, :show]

  root "distances#index"
end