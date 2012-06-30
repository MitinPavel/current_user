class MyProtectedPagesController < ApplicationController
  before_filter :authenticate_user!

  def show
    @user = ::User.first #current_user
  end
end
