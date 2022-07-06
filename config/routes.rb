Rails.application.routes.draw do
  root 'products#index'
  devise_for :users, path:'', path_names:{ sign_in:'login', sign_out:'logout', sign_up:'register'}
  resources :pages do
    member do
      get :toggle_role
    end
  end
  
  get 'profile' => 'pages#profile' 

  resources :products do
    resources :comments
  end
  
  resources :orders
end
