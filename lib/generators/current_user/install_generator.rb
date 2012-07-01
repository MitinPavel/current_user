require 'rails/generators/base'

module CurrentUser
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("../../templates", __FILE__)

      desc "Creates a CurrentUser initializer and a authentication key file to your application."

      def create_authentication_key
        create_file "config/current_user/key", ::SecureRandom.hex(20)
      end

      def copy_initializer
        template "current_user.rb", "config/initializers/current_user.rb"
      end

      def show_readme
        readme "README" if behavior == :invoke
      end
    end
  end
end
