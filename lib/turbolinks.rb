require 'turbolinks/version'
require 'turbolinks/redirection'
require 'turbolinks/route_redirection'
require 'turbolinks/assertions'
require 'turbolinks/source'

module Turbolinks
  module Controller
    extend ActiveSupport::Concern

    included do
      include Redirection
    end
  end

  class Engine < ::Rails::Engine
    config.turbolinks = ActiveSupport::OrderedOptions.new
    config.turbolinks.auto_include = true
    config.assets.paths += [Turbolinks::Source.asset_path] if config.respond_to?(:assets)

    initializer :turbolinks do |app|
      ActiveSupport.on_load(:action_controller) do
        if app.config.turbolinks.auto_include
          include Controller

          ::ActionDispatch::Assertions.include ::Turbolinks::Assertions
        end
      end

      ActiveSupport.on_load(:after_initialize) do
        # is this the right way to make sure the class is loaded before monkey patching it?
        require 'action_dispatch/routing/redirection'

        module ActionDispatch
          module Routing
            class Redirect
              include RouteRedirection
            end
          end
        end
      end
    end
  end
end
