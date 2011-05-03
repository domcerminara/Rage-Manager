PartyManager::Application.routes.draw do
  match 'host/edit' => 'hosts#edit', :as => :edit_current_host

  match 'signup' => 'hosts#new', :as => :signup

  match 'logout' => 'sessions#destroy', :as => :logout

  match 'login' => 'sessions#new', :as => :login

  resources :sessions

  resources :hosts

  resources :invitations

  resources :parties

  resources :party_types

  resources :locations

  resources :gifts

  resources :guests
  
  match 'party' => 'parties#index', :as => :party_path
  
  match 'guest' => 'guests#index', :as => :guest_path
  
  match 'contact' => 'home#contact', :as => :contact_path
                  
  match 'webmaster' => 'home#webmaster', :as => :webmaster_path
  
  match 'about' => 'home#about', :as => :about_path
  
  match 'privacy' => 'home#privacy', :as => :privacy_path
  
  match 'party_type' => 'party_types#index', :as => :party_type_path
  
  match 'location' => 'locations#index', :as => :location_path
  
  match 'invitation' => 'invitations#index', :as => :invitation_path
  
  match 'gift' => 'gifts#index', :as => :gift_path
  
  match 'rsvp' => 'invitations#start_rsvp', :as => :rsvp_path
  
  match 'details' => 'invitations#details', :as => :details_path

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

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
   root :to => "home#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
