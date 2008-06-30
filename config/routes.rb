ActionController::Routing::Routes.draw do |map|
  # The priority is based upon order of creation: first created -> highest priority.
  map.resources :classrooms, :collection => {:manager => :get, :create => :post}
   
  map.resources :subjects
  
  map.resources :comments
   
  map.resources :register
  
  map.resources :objectives
  
  map.resources :diario_de_classe_posts, :has_many => :comments
  
  # Account mapping
  #
  # This rules are responsible for make connection with account actions 
  # for login, signup and logout
  #
  map.resources :account, :collection => {:list => :get}
  
  map.login 'login', :controller => 'account', :action => 'login'
  map.logout 'logout', :controller => 'account', :action => 'logout'
  map.signup 'signup', :controller => 'account', :action => 'signup'
  map.admin 'admin', :controller => 'admin'  
  # Sample of regular route:
  # map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action
  
  # Sample of named route:
  # map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)
  
  # Putting the account controller as root controller 
  map.connect '', :controller => "account"
  
  # Install the default route as the lowest priority.
  map.connect ':controller/:action/:id.:format'
  map.connect ':controller/:action/:id'
end
