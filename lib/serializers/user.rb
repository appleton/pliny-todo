class Serializers::User < Serializers::Base
  structure(:default) do |user|
    {
      id:         user.id,
      created_at: user.created_at.iso8601,
      updated_at: user.updated_at.iso8601
    }
  end
end
