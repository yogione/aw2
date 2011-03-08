SampleApp::Application.routes.draw do


  resources :users do
    member do
      #  get :following, :followers
    end
  end

  resources :stories do
    member do
      get  :upvote, :downvote
    end
    resources :comments do
      member do
        get :upvote, :downvote
      end
    end
  end

  resources :comments do
    member do
      get :approve, :reject
    end
    collection do
      get :index
    end
  end
  
  resources :sessions,      :only => [:new, :create, :destroy] do
    collection do
      get :forgot_password, :new_password, :update_reset_password
      post :send_reset_password, :reset_new_password
    end
  end
  #  resources :microposts,    :only => [:create, :destroy]
  #resources :stories,    :only => [:create, :destroy, :show]
  resources :comments,    :only => [:create, :destroy, :new, :show]
  #  resources :relationships, :only => [:create, :destroy]
  
  root :to => "pages#home"

  # match '/upvote', :to => 'stories#upvote'
  #match '/downvote', :to => 'stories#downvote'
   match '/unsigned_retiree', :to => 'pages#unsigned_retiree'
  match '/contact', :to => 'pages#contact'
  match '/about',   :to => 'pages#about'
  match '/help',    :to => 'pages#help'
  match '/signup',  :to => 'users#new'
  match '/signin',  :to => 'sessions#new'
  match '/signout', :to => 'sessions#destroy'
  match '/poststory', :to => 'pages#poststory'
  match '/postcomment', :to => 'comments#create'
  #match '/showstory', :to => 'stories#show'
  match '/retiree', :to => 'retirees#index'

  resources :retirees do
    collection do
      post :find_retiree
    end
  end
  get "retiree/index"
  get "retiree/update"
  get "retiree/delete"
  get "retiree/create"
  get "comments/create"
  get "comments/destroy"
  get "comments/show"

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
  #       get :short
  #       post :toggle
  #     end
  #
  #     collection do
  #       get :sold
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
  #       get :recent, :on => :collection
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
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
