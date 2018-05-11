Rails.application.routes.draw do
  get 'home/index'

  devise_for :users
  resources :masters, controller: "masters"
  resources :prom_envs, controller: "prom_envs"
  resources :vik_envs, controller: "vik_envs"
  resources :viks
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'masters#index'

end
