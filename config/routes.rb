Rails.application.routes.draw do
   resources :issues, only: [] do
     get :events, on: :member
  end

  resources :events, only: [:create]
end
