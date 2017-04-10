Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'

  resources :users do
    member do
      get 'confirmation'
    end
  end

  resources :classrooms


  resources :sessions, only: [:new, :create] do
    delete :destroy, on: :collection
  end

  resources :student_sessions, only: [:new, :create] do
    delete :destroy, on: :collection
  end

  resources :experiments

  resources :assigned_experiments

  resources :bookmarks

  resources :datum

  namespace :admin do
    resources :dashboard, only: [:index]
    patch "dashboard/approve_user/:id" => "dashboard#approve_user", as: :approve_user
  end

  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      resources :charts
    end
  end

  match "/delayed_job" => DelayedJobWeb, :anchor => false, via: [:get, :post]

end
