Rails.application.routes.draw do

  devise_for :users

  resources :products do
    member do
      get :follow
      get :unfollow
    end
    collection do
      get 'search'
    end
  end

  root to: 'products#index'
  
  get '/company', to: 'company#edit', as: :edit_company
  put '/company', to: 'company#update', as: :update_company

end