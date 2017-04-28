Rails.application.routes.draw do

  resources :invoices, only: [:index, :edit]
  resources :appointments
  resources :record_types do
    resources :record_fields
    member do
      post :update_sort_position
    end
  end
  resources :patients do 
    resources :records
    resources :presciptions
    resources :invoices
  end
  resources :roles
  root to: 'visitors#index'
  devise_for :users
  resources :users
end
