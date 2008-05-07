ActionController::Routing::Routes.draw do |map|
  map.resources :classrooms

  map.resources :subjects

  map.resources :comments

  map.resources :diario_de_classe_posts, :has_many => :comments

  # The priority is based upon order of creation: first created -> highest priority.
  map.root :controller => 'account'
  



end
