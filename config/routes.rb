Rails.application.routes.draw do
  namespace :admins_backoffice do
    get 'welcome/index' # Dashboard
    resources :admins   # Administradores
    resources :subjects # Assuntos / Áreas
    resources :questions # Perguntas
  end

  namespace :site do
    get  'welcome/index'
    get  'search', to: 'search#questions'
    get  'subject/:subject_id/:subject', to: 'search#subject', as: 'search_subject'
    post 'answer', to: 'answer#question'
  end

  namespace :users_backoffice do
    get 'welcome/index'
    get 'profile', to: 'profile#edit'
    patch 'profile', to: 'profile#update'
  end
  
  get 'backoffice', to: 'admins_backoffice/welcome#index'
  get 'user_backoffice', to: 'users_backoffice/welcome#index'

  devise_for :users
  devise_for :admins, skip: [:registrations]

  root to: 'site/welcome#index'
end
