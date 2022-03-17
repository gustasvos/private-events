Rails.application.routes.draw do
  resources :events
  resources :attendances
  
  devise_for :admins
  
  root "events#index"
end
