Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :lists, only: [:index, :create, :show] do
    collection do
      post :cal_distance
    end
  end
  namespace :admin do
    resources :services do
      collection do
        post :import
      end
    end
    resources :interchanges
    root "services#index"
  end
  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      resources :freeways, only: [:index, :show]
      resources :interchanges, only: :index
    end
  end
  root "lists#index"
end
