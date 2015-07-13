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
      @auth_header ||= request.env['HTTP_AUTHORIZATION']
    end

    def current_user
      p auth_header
      @current_user ||= User[auth_header]
    end

    def authorize!
      fail Pliny::Errors::Unauthorized if current_user.nil?
    end
  end
end
