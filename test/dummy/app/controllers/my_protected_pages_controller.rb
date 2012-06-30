class MyProtectedPagesController < ApplicationController
  before_filter :authenticate_user!

  def show
    render :text => 'Unauthorized', :status => 401
  end
end
