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

  describe 'GET /users' do
    it 'returns correct status code and conforms to schema' do
      get '/users'
      assert_equal 200, last_response.status
      assert_schema_conform
    end
  end

  describe 'POST /users' do
    it 'returns correct status code and conforms to schema' do
      header "Content-Type", "application/json"
      post '/users', MultiJson.encode({})
      assert_equal 201, last_response.status
      assert_schema_conform
    end
  end

  describe 'GET /users/:id' do
    it 'returns correct status code and conforms to schema' do
      get "/users/123"
      assert_equal 200, last_response.status
      assert_schema_conform
    end
  end

  describe 'PATCH /users/:id' do
    it 'returns correct status code and conforms to schema' do
      header "Content-Type", "application/json"
      patch '/users/123', MultiJson.encode({})
      assert_equal 200, last_response.status
      assert_schema_conform
    end
  end

  describe 'DELETE /users/:id' do
    it 'returns correct status code and conforms to schema' do
      delete '/users/123'
      assert_equal 200, last_response.status
      assert_schema_conform
    end
  end
end
