RailsApp::Application.routes.draw do
  resource :dashboard, :only => :show
end
