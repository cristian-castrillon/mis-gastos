Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # root 'dashboard#index'
  root 'dashboard#index'
  resources :expenses, only: [:index, :create, :update, :destroy, :edit, :new]

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :expenses, only: [:index, :create, :update, :destroy]
    end
  end
end
