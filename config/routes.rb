Rails.application.routes.draw do
  resources :pets
  get 'welcome/index'
  root to: 'welcome#index'
end
