Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  get 'shopping_cart/show', path: 'carrito'
  post 'shopping_cart/add_product_to_cart'
  post 'shopping_cart/delete_item'
  post 'shopping_cart/update_cart'
  get 'shopping_cart/purchase'

  devise_for :users

  resources :users, only: [:show, :edit, :update], path: 'usuario'

  resources :products, only: [:index, :show], path: 'productos'

  get 'product/quick_view' => 'products#quick_view'


  root 'pages#home'

  get 'pages/confirmation', path: 'confirmacion'
  get 'pages/home'
  # get 'pages/construction'
  get 'pages/faq', path: 'preguntas-frecuentes'
  get 'pages/terms_and_conditions', path: 'terminos_y_condiciones'

  resource "contacts", only: [:show, :create], path: 'contacto'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
