CurrentUser::Application.routes.draw do
  resources :sessions, :only => [:new, :create]
end
