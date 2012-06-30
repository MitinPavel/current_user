require 'singleton'

module CurrentUser
  class Config
    include Singleton

    attr_accessor :key
  end
end