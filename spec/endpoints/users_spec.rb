require "spec_helper"

describe Endpoints::Users do
  include Rack::Test::Methods

  describe "GET /users" do
    it "succeeds" do
      get "/users"
      assert_equal 200, last_response.status
    end
  end
end
