Rails.application.routes.draw do
  devise_for :users

  resources :supporttickets do
    post 'create_response', on: :member
  end

  root to: 'supporttickets#index'

  namespace :api do
    namespace :v1 do
      resources :supporttickets, only: [:index, :show, :create, :update, :destroy] do
        post 'responses', to: 'supporttickets#create_response', on: :member
      end
    end
  end
end
