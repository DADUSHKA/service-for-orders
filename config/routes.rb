Rails.application.routes.draw do
  root "ingredients#index"
  resources :orders, except: %i[show update]

  resources :ingredients, only: %i[index update]

  namespace :api do
    resources :dishes, only: [:index]
  end
end
