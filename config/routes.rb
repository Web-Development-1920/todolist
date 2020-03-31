Rails.application.routes.draw do
    devise_for :users
    get 'todolist/index'
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
    resources :tasks
    resources :projects
    resources :users

    root 'todolist#index'
end
