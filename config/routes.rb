CurrentUser::Engine.routes.draw do
  match 'sign_in' => 'sessions#new', :via => 'get', :as => 'sing_in_form'
  match 'sign_in' => 'sessions#create', :via => 'post', :as => 'sing_in'
end
 
