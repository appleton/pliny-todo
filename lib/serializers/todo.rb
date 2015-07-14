class Serializers::Todo < Serializers::Base
  structure(:default) do |todo|
    {
      id:         todo.id,
      created_at: todo.created_at.utc,
      updated_at: todo.updated_at.utc,
      title:      todo.title,
      completed:  todo.completed,
      links: {
        user: todo.user_id
      }
    }
  end
end
