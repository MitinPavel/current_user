require_dependency "current_user/application_controller"

module CurrentUser
  class SessionsController < ApplicationController
    before_filter :check_key

    def new
      sign_out
      @users = users
    end

    def create
      user = ::User.find params[:user_id]
      sign_in user
      redirect_to main_app.root_url
    end

    private

    def check_key
      key = ::CurrentUser.authentication_key

      if key.blank? || key != params[:key]
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
