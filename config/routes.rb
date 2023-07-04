Rails.application.routes.draw do
  devise_for :users

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "categories#index"

  # Routes for Users controller
  resources :users, only: [:show, :edit, :update]

  # Routes for Expenses controller
  resources :expenses, only: [:new, :create]

  # Routes for ExpenseCategories controller
  resources :expense_categories

  # Routes for Categories controller
  resources :categories, only: [:new, :create]
end
