class MyProtectedPagesController < ApplicationController
  def show
    render :text => 'Unauthorized', :status => 401
  end
end
