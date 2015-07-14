module Endpoints
  class Todos < Base
    namespace "/todos" do
      before do
        authorize!
      end

      post do
        new_todo = Mediators::Todos::Creator.run(
          user:      current_user,
          title:     body_params[:title],
          completed: body_params[:completed]
        ).model

        status(201)
        encode(serialize(new_todo))
      end

      get do
        status(200)
        encode(serialize(current_user.todos))
      end

      namespace "/:id" do
        get  do |id|
          todo = get_todo!(id)
          status(200)
          encode(serialize(todo))
        end

        delete do |id|
          todo = Mediators::Todos::Destroyer.run(
            todo: get_todo!(id)
          ).model
          status(200)
          encode(serialize(todo))
        end

        patch do |id|
          todo = Mediators::Todos::Updater.run(
            todo:      get_todo!(id),
            title:     body_params[:title],
            completed: body_params[:completed]
          ).model
          status(200)
          encode(serialize(todo))
        end
      end
    end

    private

    def get_todo!(id)
      Todo.find(user: current_user, id: id) || (fail Pliny::Errors::NotFound)
    rescue Sequel::DatabaseError
      # Handle a non-uuid being passed
      fail Pliny::Errors::NotFound
    end

    def serialize(todo, structure = :default)
      Serializers::Todo.new(structure).serialize(todo)
    end
  end
end
