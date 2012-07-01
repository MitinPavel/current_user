CurrentUser::Engine.routes.draw do
  match ':key/sign_in' => 'sessions#new', :via => :get, :as => 'sign_in'
  match ':key/sign_in' => 'sessions#create', :via => :post
  match :destroy, :path => 'sign_out', :controller => 'sessions', :action =>  'destroy', :as => "destroy", :via => :get

end
