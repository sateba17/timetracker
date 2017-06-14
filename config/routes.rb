Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'companies#index'

  get 'recentworks/:days' => 'works#index'

  get 'timetrackerproject/:slug' => 'projects#show'

  resources :companies
  resources :projects
  resources :works
end
