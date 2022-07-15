Rails.application.routes.draw do
  get 'cart' => 'carts#show'
  root 'products#index'
  resources :cart_products
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

  post 'cart_products/add' => "cart_products#add_quantity", as: "cart_product_add"
  post 'cart_products/remove' => "cart_products#remove_quantity", as: "cart_product_remove"
end
