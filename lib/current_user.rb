require 'current_user/constants'
require 'current_user/controller/helpers'
require 'current_user/engine'

module CurrentUser
  def self.setup
    yield self
  end

  mattr_accessor :authentication_key

  mattr_accessor :identifier

  def identifier_for(user)
    identifier = ::CurrentUser.identifier

    if identifier.respond_to? :call
      identifier.call user
    else
      user.send identifier
    end
  end
  module_function :identifier_for
end
