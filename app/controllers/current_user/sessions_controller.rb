require_dependency "current_user/application_controller"

module CurrentUser
  class SessionsController < ApplicationController
    before_filter :check_key

    def new
      @users = ::User.order 'email'
      @sign_in_url = key_sign_in_url ::CurrentUser::Config.instance.key
    end

    def create
      session[::CurrentUser::USER_SESSION_KEY] = params[:user_id]
      redirect_to '/'
    end

    private

    def check_key
      if ::CurrentUser::Config.instance.key != params[:key_id]
        render_unauthorized
      end
    end
  end
end
