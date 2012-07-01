CurrentUser::Engine.routes.draw do
  match ':key/sign_in' => 'sessions#new', :via => :get, :as => 'sign_in'
  match ':key/sign_in' => 'sessions#create', :via => :post
end
