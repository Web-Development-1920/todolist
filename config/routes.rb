Rails.application.routes.draw do
    get 'todolist/index'
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
    resources :tasks
    resources :projects

    root 'todolist#index'
end
