Rails.application.routes.draw do

  mount CurrentUser::Engine => "/current_user"
end
