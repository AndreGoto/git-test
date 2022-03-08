Rails.application.routes.draw do
  namespace :issues do
    resources :events, only: [:index]
  end

  resources :events, only: [:create]
end
