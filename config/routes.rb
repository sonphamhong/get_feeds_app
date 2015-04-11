GetFeedsApp::Application.routes.draw do

  devise_for :admins

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  devise_scope :user do
    get 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
  end
  namespace :website do
    get "home/index", :to => "home#index"
    get "artices/show/:id", :to => "artices#show"
  end
  namespace :admin do
    resources :feed, :only => [:index, :edit, :update, :destroy] 
    resources :page, :only => [:index, :edit, :update, :destroy, :create, :new]
    get "/home", :to => "home#index"
    get "feed/published_switch", :to => "feed#update_published_switch", :as => "update_published_switch"
    get "feed/get_feeds", :to => "feed#get_feeds", :as => "get_feeds"
    get "/callback", :to => "feed#callback"
    get "/get_access_token", :to => "feed#get_access_token_facebook"
  end
  root :to => 'website/home#index'
  post "save_post", :to => "users/profile#save_article_to_user", :as => "save_post"
  get "profile", :to => "users/profile#index", :as => "profile"
  match 'follow' => 'users/profile#follow'
  match 'unfollow' => 'users/profile#unfollow'
  get "profile", :to => "users/profile#show", :as => "profile"
  get "delele_article_user", :to => "users/profile#delete_article_user", :as => "delete_article_user"
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
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
