Rails.application.routes.draw do
  root 'products#index'
  devise_for :users, path:'', path_names:{ sign_in:'login', sign_out:'logout', sign_up:'register'}
  resources :pages do
    member do
      get :toggle_role
      get :profile
    end
  end

  resources :products do
    resources :comments
  end
  
  resources :orders
end
