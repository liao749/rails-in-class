Rails.application.routes.draw do
  get 'users',to: 'users#index'
  get 'users/new'
  get 'users/:id',to: 'users#show', as: 'user'
  get 'users/edit'
  post 'users',to: 'users#create'
  get 'users/:id/edit',to: 'users#edit', as: 'edit_user'
  delete 'users/:id',to: 'users#destroy'
  patch 'users/:id', to: 'users#update'
  
  
  
  root to: 'static_page#home'
  get  'help', to:'static_page#help'
  get 'about',to:'static_page#about'
  get 'contact',to:'static_page#contact'

end
