Rails.application.routes.draw do
  resources :projects
  devise_for :users
  root to: 'home#index'
  get 'datatable_i18n', to: 'datatables#datatable_i18n'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
