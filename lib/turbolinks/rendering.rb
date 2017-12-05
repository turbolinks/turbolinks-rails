module Turbolinks
  module Rendering
    extend ActiveSupport::Concern

    def render(*args)
      action, options = args
      options = action if action.respond_to?(:permitted?) || action.is_a?(Hash)
      force_turbolinks = options && options[:turbolinks]

      super.tap do
        if force_turbolinks && status >= 300 && request.headers["Turbolinks-Referrer"]
          response.headers["Turbolinks-Force-Success"] = 'true'
        end
      end
    end
  end
end
