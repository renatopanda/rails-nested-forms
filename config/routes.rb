Rails.application.routes.draw do
  resources :projects, only: [:new, :create, :edit, :update]

  root to: 'projects#index'

end
