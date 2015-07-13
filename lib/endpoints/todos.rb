module Endpoints
  class Todos < Base
    namespace "/todos" do
      before do
        p '???'
        authorize!
      end

      post do
        new_todo = Mediators::Todos::Creator.run(
          user:      current_user,
          title:     body_params[:title],
          completed: body_params[:completed]
        ).model

        status(201)
        encode(new_todo)
      end

      get do
        status(200)
        encode(current_user.todos)
      end

      namespace "/:id" do |id|
        get do
          todo = get_todo!(id)
          status(200)
          encode(todo)
        end

        delete do
          todo = Mediators::Todos::Destroyer.run(
            todo: get_todo!(id)
          ).model
          status(200)
          encode(todo)
        end

        patch do
          todo = Mediators::Todos::Updater.run(
            todo:      get_todo!(id),
            title:     body_params[:title],
            completed: body_params[:completed]
          ).model
          status(200)
          encode(todo)
        end
      end
    end
  end
end
