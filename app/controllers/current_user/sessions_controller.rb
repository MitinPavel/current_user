module CurrentUser
  class SessionsController < ApplicationController
    def new
      @resources = User.all    #TODO get from settings 
      @resource = User.new     #TODO get from settings 
      @id_method_name = :email #TODO get from settings 
    end

    def create
    end
  end
end
