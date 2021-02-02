Rails.application.routes.draw do
  root "sessions#welcome"
  resources :users, only: [:index, :new, :create, :show]
  resources :events, only: [:index, :new, :create, :show]   
  get 'login', to: 'sessions#new'   
  post 'login', to: 'sessions#create'   
  get 'welcome', to: 'sessions#welcome'
  delete 'sign_out' => 'sessions#destroy'
  post 'event_attendances/create' => 'event_attendances'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
