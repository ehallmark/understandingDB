Rails.application.routes.draw do
  resources :members
  resources :entries
  resources :random_variables
  
  get '/random_variables/regenerate_data/:id' => "random_variables#regenerate_data", as: :random_variable_regenerate_data
  post '/random_variables/get_values_gt_or_lt_num/:id' => "random_variables#get_values_gt_or_lt_num", as: :get_values_gt_or_lt_num
  post '/random_variables/get_probability_gt_or_lt_num/:id' => "random_variables#get_probability_gt_or_lt_num", as: :get_probability_gt_or_lt_num
  post '/random_variables/get_theoretical_probability_gt_or_lt_num/:id' => "random_variables#get_theoretical_probability_gt_or_lt_num", as: :get_theoretical_probability_gt_or_lt_num
  get '/statistics' => 'statistics#index'
  get '/import_file' => 'entries#file_upload'
  post '/import' => 'entries#import', as: :entries_import
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
