ActionController::Routing::Routes.draw do |map|
  map.root :controller => 'urls', :action => 'new'
  map.resources :urls
  map.offsite "/:slug", :controller => 'redirects', :action => 'show'
end
