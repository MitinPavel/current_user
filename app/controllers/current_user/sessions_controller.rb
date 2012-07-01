require_dependency "current_user/application_controller"

module CurrentUser
  class SessionsController < ApplicationController
    before_filter :check_key

    def new
      @users = users
      @sign_in_url = key_sign_in_url ::CurrentUser.authentication_key
    end

    def create
      session[::CurrentUser::USER_SESSION_KEY] = params[:user_id]
      redirect_to '/'
    end

    private

    def check_key
      if ::CurrentUser.authentication_key != params[:key_id]
        render_unauthorized
      end
    end

    # TODO: move it from the controller
    def users
      identifier = ::CurrentUser.identifier

      if identifier.respond_to? :call
        ::User.all.sort { |x,y| identifier.call(y) <=> identifier.call(x) }
      else
        ::User.order identifier.to_s
      end
    end
  end
end
