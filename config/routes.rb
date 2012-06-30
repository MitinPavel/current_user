CurrentUser::Engine.routes.draw do
  resources :keys, :only => [] do
    resource :sign_in, :controller => 'sessions', :only => [:new, :create]
  end
end
