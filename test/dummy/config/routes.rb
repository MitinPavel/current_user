Rails.application.routes.draw do
  mount CurrentUser::Engine => "/current_user"

  resource :my_protected_page, :only => :show
  root :to => 'my_protected_pages#show'
end
