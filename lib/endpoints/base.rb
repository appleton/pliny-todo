module Endpoints
  # The base class for all Sinatra-based endpoints. Use sparingly.
  class Base < Sinatra::Base
    register Pliny::Extensions::Instruments
    register Sinatra::Namespace

    helpers Pliny::Helpers::Encode
    helpers Pliny::Helpers::Params

    set :dump_errors, false
    set :raise_errors, true
    set :root, Config.root
    set :show_exceptions, false

    configure :development do
      register Sinatra::Reloader
      also_reload '../**/*.rb'
    end

    error Sinatra::NotFound do
      content_type :json
      status 404
      "{}"
    end

    before do
      content_type :json, charset: 'utf-8'
    end

    private

    def auth_header
      @auth_header ||= (request.env['HTTP_AUTHORIZATION'] || "").match(/^Bearer\s+(.*)/)[1]
    end

    def current_user
      @current_user ||= begin
        User[auth_header]
      rescue Sequel::DatabaseError
        # Handle a non-uuid being passed
        nil
      end
    end

    def authorize!
      fail Pliny::Errors::Unauthorized if current_user.nil?
    end
  end
end
