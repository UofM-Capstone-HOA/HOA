Rails.application.routes.draw do
  get 'hoaroutes/index'

  get 'hoaroute/index'

  # get 'admin/index'

  devise_for :users

  devise_scope :user do
    #authenticated is currently set to pantry to be changed later
    authenticated :user do
      root 'issues#index', as: :authenticated_root
    end

    unauthenticated do
      root 'static_pages#welcome', as: :unauthenticated_root
    end
  end

  # Temporary home
  get 'home', to: 'static_pages#home', as: 'home'

  get 'welcome', to: 'static_pages#welcome', as: 'welcome'
  post 'admin/show_ic', to: 'admin#show_ic'
  post 'admin/edit_ic', to: 'admin#edit_ic'
  post 'admin/show_ho', to: 'admin#show_ho'
  post 'admin/edit_ho', to: 'admin#edit_ho'
  post 'admin/show_address', to: 'admin#show_address'
  post 'admin/edit_address', to: 'admin#edit_address'


  get 'hoaroutes/getroute', to: 'hoaroutes#getroute', as: 'route'
  post 'hoaroutes/postroute', to: 'hoaroutes#postroute'

  resources :issues
  resources :home_owners
  resources :addresses
  resources :issue_categories
  resources :admin
  resources :hoaroutes

 #root to: 'application#index'


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
