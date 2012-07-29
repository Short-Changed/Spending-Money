SpendingMoney::Application.routes.draw do
  devise_for :users
  resources :spending
  resources :functions
  resources :programs
  resources :departments
  resources :expenditures
  match ':controller(/:action(/:id))(.:format)'
  root :to => 'welcome#index'
end
