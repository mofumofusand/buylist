Rails.application.routes.draw do
  devise_for :users
  root to: 'lists#search'
  resources :lists do
    collection do
      get 'search'
    end
  end
end
