require 'rails/generators/base'

module CurrentUser
  module Generators
    class InstallGenerator < Rails::Generators::Base
      def create_initializer_file
        create_file "config/current_user/key", ::SecureRandom.hex(20)
      end
    end
  end
end