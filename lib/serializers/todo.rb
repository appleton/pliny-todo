class Serializers::Todo < Serializers::Base
  structure(:default) do |todo|
    {
      id:         todo.id,
      created_at: todo.created_at.iso8601,
      updated_at: todo.updated_at.iso8601,
      name:      todo.title,
      completed:  todo.completed,
      links: {
        user: todo.user_id
      }
    }
  end
end
