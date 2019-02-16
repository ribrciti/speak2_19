Rails.application.routes.draw do

  devise_for :users

  resources :conversastions do 
  	resources :messages
  end

  root to: "conversations#index"
end
