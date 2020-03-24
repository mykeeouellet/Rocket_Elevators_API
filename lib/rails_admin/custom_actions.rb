module RailsAdmin
  module Config
    module Actions
      class Customaction < RailsAdmin::Config::Actions::Base
        register_instance_option :member do  #	this is for specific record
          true
        end
        register_instance_option :pjax? do
          false
        end
        register_instance_option :visible? do
          authorized?
        end
        class Root < RailsAdmin::Config::Actions::Base
          RailsAdmin::Config::Actions.register(self)
          register_instance_option :root do
            true
          end
        end
      end
    end
  end
end
