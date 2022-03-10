Rails.application.routes.draw do
  resources :events
  
  devise_for :admins
  
  root "events#index"
end
