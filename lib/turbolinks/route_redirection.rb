module Turbolinks
  module RouteRedirection
    def serve(req)
      super.tap do |(_, headers, _)|
        headers["Turbolinks-Location"] = headers["Location"]
      end
    end
  end
end
