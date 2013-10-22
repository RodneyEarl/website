Website::Application.routes.draw do

  devise_for :users

  match '/contact', to: 'contact#new', via: 'get'
  match '/contact', to: 'contact#create', via: 'post'

  match '/projects', to: 'projects#index', via: 'get'
  match '/projects', to: 'projects#create', via: 'post'

  match '/work',       to: 'static_pages#work',       via: 'get'
  match '/papers',     to: 'static_pages#papers',     via: 'get'
  match '/references', to: 'static_pages#references', via: 'get'
  root 'static_pages#home'
end
