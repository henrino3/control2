Rails.application.routes.draw do


  root 'home_pages#index'

  resources :citizens

  devise_for :banks,
  :controllers => {
    sessions: 'banks/sessions',
    registrations: 'banks/registrations'
  }

  devise_for :admins, 
  :controllers => {
    sessions: 'admin/sessions',
    registrations: 'admin/registrations'
  }
  
  resources :banks
  resources :transactions
  resources :citizen_bank_data

  #transaction access by banks
  get '/transaction/get', to: 'banks#getTransactionApi'
  post '/transaction/post', to: 'transactions#postTransactionApi'

  get  '/citizen/get' , to: 'citizen_bank_data#getCitizen'
  post  '/citizen/post' , to:'citizens#postcitizen'
  
  #change Token
  get  '/tokengen' , to:'banks#genToken'

  



  # devise_scope :admins do
  #   #root to: 'citizens#index', :constraints => {:subdomain => /.+/}
  #   root to: 'citizens#index' , as: :admins_root # creates admin_root_path
  # end
  # devise_scope :banks do
  #   root to: 'banks#index' , as: :banks_root# creates bank_root_path
  # end
    #root "banks#index"

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
