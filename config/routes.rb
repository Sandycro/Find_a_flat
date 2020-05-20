Rails.application.routes.draw do
  devise_for :users
  root to: 'flats#index'
  resources :flats , except: :destroy do
    resources :bookings, only: [:create , :new]
  end
  resources :bookings, only: [ :destroy ]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
