Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :distances, only: [:index, :create, :show] do
    collection do
      post :cal_distance
    end
  end
  namespace :admin do
    resources :services
    resources :interchanges
    root "services#index"
  end
  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      resources :freeways, only: [:index, :show]
      resources :interchanges, only: :index
    end
  end
  root "distances#index"
end
