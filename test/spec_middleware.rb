require 'minitest/autorun'
require 'logleaks/middleware'
require 'logger'

describe "Logleaks::Middleware" do
  before do
    @app = lambda do |env|
      [200, {'Content-Type' => 'text/plain'}, 'response body']
    end
    @log = StringIO.new
    @options = { logger: Logger.new(@log) }
  end

  it "returns the supplied app's response" do
    status, headers, body = Logleaks::Middleware.new(@app, @options).call({})

    status.must_equal 200
    headers['Content-Type'].must_equal 'text/plain'
    body.must_equal 'response body'
  end

  it "logs some memories" do
    Logleaks::Middleware.new(@app, @options).call({})
    @log.string.must_include 'rss memory'
  end

  it "uses Rails.logger by default if it is available" do
    module Rails; def self.logger; "rails-logger"; end; end
    middleware = Logleaks::Middleware.new(@app, {})
    middleware.logger.must_equal "rails-logger"
    Object.send :remove_const, :Rails
  end

  it "raises an error if Rails.logger is not avaiable and logger is not supplied" do
    begin
      Logleaks::Middleware.new(@app, {})
    rescue ArgumentError => error
      error.message.must_include 'logger option'
    else
      assert false
    end
  end
end
