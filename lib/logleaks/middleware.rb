module Logleaks
  class Middleware
    def initialize(app, *args)
      @app = app
      @args = args
    end

    def call(env)
      @app.call(env)
    end
  end
end
