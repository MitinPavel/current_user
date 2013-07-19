Rails.application.routes.draw do
  mount CurrentUser::Engine => '/current_user'

  root :to => 'my_protected_pages#show'

  resource :my_protected_page, :only => :show
  resource :my_another_protected_page, :only => :show

  get 'helpers/(:action)', :controller => :helpers

end
