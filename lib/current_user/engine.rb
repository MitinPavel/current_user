module CurrentUser
  class Engine < ::Rails::Engine
    isolate_namespace CurrentUser
  end
end
