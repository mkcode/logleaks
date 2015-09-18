require 'minitest/autorun'
require 'rack/mock'
require 'logleaks/middleware'

describe "Logleaks::Middleware" do
  app = lambda do |env|
    [200, {'Content-Type' => 'text/plain'}, 'response body']
  end

  specify "returns the supplied app's response" do
    status, headers, body = Logleaks::Middleware.new(app).call({})

    status.must_equal 200
    headers['Content-Type'].must_equal 'text/plain'
    body.must_equal 'response body'
  end
end
