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
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end

  # Temporary home
  get 'home', to: 'static_pages#home', as: 'home'
  get 'welcome', to: 'static_pages#welcome', as: 'welcome'

  # issues page and modals
  # get 'issues/:id/show', to: 'issues#show', as: 'issues'

  get 'issues/map', to: 'issues#map', as: 'map'
  
  # admin page and modals
  get 'admin/issue_category', to: 'admin#show_ic', as: 'admin/issue_category'
  post 'admin/edit_ic', to: 'admin#edit_ic' 
  get 'admin/homeowner', to: 'admin#show_ho', as: 'admin/homeowner'
  post 'admin/edit_ho', to: 'admin#edit_ho'
  get 'admin/address', to: 'admin#show_address', as: 'admin/address'
  post 'admin/edit_address', to: 'admin#edit_address'

  get 'hoaroutes/getkml', to: 'hoaroutes#getkml'
  get 'hoaroutes/getroute', to: 'hoaroutes#getroute', as: 'route'
  post 'hoaroutes/postroute', to: 'hoaroutes#postroute'

  get '*a/createroute', to: 'hoaroutes#createroute', as: 'createroute'
  get '*a/issues/new', to: 'issues#new', as: 'issues/new'
  
  get 'issues/postletter', to: 'issues#letter', as: 'letter'
  #post 'issues/postletter', to: 'issues#postletter', as: 'letter'

  resources :issues
  resources :home_owners
  resources :addresses
  resources :issue_categories
  resources :admin
  resources :hoaroutes

  resources :addresses do
    collection { post :import}
  end

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
