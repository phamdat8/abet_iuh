Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'homes#index'
  namespace :admin do
    get '/asd', to: 'home#index'
    root 'home#index'
    resources :users
    get '/user/import', to: 'users#import'
    post '/user/import', to: 'users#import_data'
    resources :subjects do
      resources :score_types
    end
    resources :original_classes
    resources :students
    resources :section_classes
  end
  namespace 'lecturer' do
    root 'home#index'
    resources :students
    resources :subjects
    resources :score_boards
  end
end
