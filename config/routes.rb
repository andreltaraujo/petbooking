Rails.application.routes.draw do

  resources :medical_records
  resources :pets
  get 'welcome/index'
  root to: 'welcome#index'
end
