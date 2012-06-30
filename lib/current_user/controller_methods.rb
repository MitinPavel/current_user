module CurrentUser
  module ControllerMethods
    def authenticate_user!
      if current_user.nil?
        render :text => 'Unauthorized', :status => :unauthorized
      end
    end

    def current_user
      user_id = session[::CurrentUser::USER_SESSION_KEY]

      ::User.find_by_id user_id
    end
  end
end