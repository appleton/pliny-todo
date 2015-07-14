class Serializers::User < Serializers::Base
  structure(:default) do |user|
    {
      id:         user.id,
      created_at: user.created_at.utc,
      updated_at: user.updated_at.utc
    }
  end
end
