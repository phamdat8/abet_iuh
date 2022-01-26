Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'homes#index'
  namespace :admin do
    root 'home#index'
    resources :users
    resources :subjects
    resources :original_classes
    resources :students
  end
  namespace 'lecturer' do
    root 'home#index'
  end
end
