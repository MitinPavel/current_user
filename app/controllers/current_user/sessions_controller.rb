require_dependency "current_user/application_controller"

module CurrentUser
  class SessionsController < ApplicationController
    def new
      @users = ::User.all
    end

    def create
      redirect_to '/'
    end
  end
end
