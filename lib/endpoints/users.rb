module Endpoints
  class Users < Base
    namespace "/users" do
      post do
        user = Mediators::Users::Creator.run
        status(201)
        encode(serialize(user))
      end
    end

    private

    def serialize(user, structure = :default)
      Serializers::User.new(structure).serialize(user)
    end
  end
end
