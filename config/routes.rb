Rails.application.routes.draw do
  root 'products#index'
  devise_for :users, path:'', path_names:{ sign_in:'login', sign_out:'logout', sign_up:'register'}
  resources :pages do
    member do
      get :toggle_role
      get :profile
    end
  end

  resources :products
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
