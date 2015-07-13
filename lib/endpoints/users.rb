module Endpoints
  class Users < Base
    namespace "/users" do
      post do
        user = Mediators::Users::Creator.run
        status(201)
        encode(user)
      end
    end
  end
end
