RailsApp::Application.routes.draw do
  resource :dashboard, :only => :show

  mount CurrentUser::Engine => "/users"
end
