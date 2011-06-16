module CurrentUser
  class SessionsController < ApplicationController
    def new
      @resources = User.all    #TODO get from settings 
      @id_method_name = :email #TODO get from settings 
    end
  end
end
