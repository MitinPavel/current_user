require 'current_user/constants'
require 'current_user/controller/helpers'

module CurrentUser
  class Engine < ::Rails::Engine
    isolate_namespace CurrentUser
  end
end
