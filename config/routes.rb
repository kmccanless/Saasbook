Rottenpotatoes::Application.routes.draw do
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  match "movies" => "movies#index", :as => "movies"
  match "movies/sort/:sort" => "movies#sort", :as => "sort_movies"
  match "movies/filter/" => "movies#index", :as => "filter_movies"
  match "movies/show/:id" => "movies#show", :as => "show_movie"
  match "movies/new" => "movies#new", :as => "new_movie"
  match "movies/:id/edit" => "movies#edit", :as => "edit_movie"
  match "movies/update/:id" => "movies#update", :as => "update_movie", :via => :put
  match "movies/destroy/:id" => "movies#destroy", :as => "movie", :via => :delete
  #match 'movies/sort/:sort' => 'movies#sort', :as => "sort_movies"
  #match 'movies/:sort/:filter' => 'movies#index', :as => "sort_movies"
 # match 'movies/filter' =>   'movies#filter', :as => "filter_movies"
  #match 'movies/:sort' => 'movies#index', :constraints => {:sort => /\w+/}
  #match 'movies/:sort' => 'movies#index', :constraints => {:id => /\d+/}
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products
  #resources :movies

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
