require 'current_user/constants'
require 'current_user/controller/helpers'
require 'current_user/engine'

module CurrentUser
  def self.setup
    yield self
  end

  mattr_accessor :authentication_key
end
