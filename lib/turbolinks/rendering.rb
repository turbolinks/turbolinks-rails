module Turbolinks
  module Rendering
    extend ActiveSupport::Concern

    def render(*)
      super.tap do
        response.headers["Turbolinks-Status"] = "OK"
      end
    end
  end
end
