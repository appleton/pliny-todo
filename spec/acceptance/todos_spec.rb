require "spec_helper"

describe Endpoints::Todos do
  include Committee::Test::Methods
  include Rack::Test::Methods

  def app
    Routes
  end

  def schema_path
    "./schema/schema.json"
  end

  let!(:user) { User.create }
  let!(:todo) { Todo.create(user: user, title: 'Shopping') }

  before { header("Authorization", user.id) }

  describe 'GET /todos' do
    it 'returns correct status code and conforms to schema' do
      get '/todos'
      assert_equal 200, last_response.status
      assert_schema_conform
    end
  end

  describe 'POST /todos' do
    it 'returns correct status code and conforms to schema' do
      header "Content-Type", "application/json"
      post '/todos', MultiJson.encode(title: "Go Shopping")
      assert_equal 201, last_response.status
      assert_schema_conform
    end
  end

  describe 'GET /todos/:id' do
    it 'returns correct status code and conforms to schema' do
      get "/todos/#{todo.id}"
      assert_equal 200, last_response.status
      assert_schema_conform
    end
  end

  describe 'PATCH /todos/:id' do
    it 'returns correct status code and conforms to schema' do
      header "Content-Type", "application/json"
      patch "/todos/#{todo.id}", MultiJson.encode(completed: true)
      assert_equal 200, last_response.status
      assert_schema_conform
    end
  end

  describe 'DELETE /todos/:id' do
    it 'returns correct status code and conforms to schema' do
      delete "/todos/#{todo.id}"
      assert_equal 200, last_response.status
      assert_schema_conform
    end
  end
end
