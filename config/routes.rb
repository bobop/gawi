Rails.application.routes.draw do
  devise_for :users
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'index#index'

  resources :search, only: [:index]

  resource :api do
    get "weather", to: 'api#weather', on: :collection
    get "bacon", to: 'api#bacon', on: :collection
    get "place", to: 'api#place', on: :collection
    get "this_little_piggy_went_to_market", to: 'api#this_little_piggy_went_to_market', on: :collection
    get "admin_ward", to: 'api#admin_ward', on: :collection
  end

  get '/:crime/:admin_ward', to: 'index#show', as: 'info'
  
  resources :index, only: :create


  
end
