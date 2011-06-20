CurrentUser::Engine.routes.draw do
  resource :session, :only => :create
  match 'sign_in' => 'sessions#new', :via => 'get', :as => 'sing_in_form'
  match 'sign_in' => 'sessions#create', :via => 'post', :as => 'sing_in'
end
 
