require "spec_helper"

describe Endpoints::Users do
  include Committee::Test::Methods
  include Rack::Test::Methods

  def app
    Routes
  end

  def schema_path
    "./schema/schema.json"
  end

  let(:user) { User.create }

  describe 'POST /users' do
    it 'returns correct status code and conforms to schema' do
      header "Content-Type", "application/json"
      post '/users', MultiJson.encode({})
      assert_equal 201, last_response.status
      assert_schema_conform
    end
  end

  describe 'GET /users/~' do
    it 'returns correct status code and conforms to schema' do
      header "Content-Type", "application/json"
      header "Authorization", "Bearer #{user.id}"
      get '/users/~'
      assert_equal 200, last_response.status
      assert_schema_conform
    end
  end
end
