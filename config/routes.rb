Rails.application.routes.draw do
  devise_for :users
  resources :xreflendings
  resources :xreflendings
  #get 'welcome/index'
  
  # You can have the root of your site routed with "root"
  root 'listing#index'

  resources :equipment
  resources :employees
  resources :equipment_types
  resources :locations
  resources :sectors
  resources :users
  
  # Rotas de custom views
  get 'listing' => 'listing#index'
  get 'users' => 'user#index'
  match 'users/:id' => 'users#destroy', :via => :delete, :as => :destroy_user
  
  # [Danilo] Rota para dependent dropdowns
  get "equipments/:equipment_type_id/equipments" => "equipment#equipments", :as => "equipments", :format => :json
  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

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
