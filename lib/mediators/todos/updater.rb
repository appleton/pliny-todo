module Mediators::Todos
  class Updater < Mediators::Base
    attr_reader :model

    def initialize(todo:, title: nil, completed: nil)
      @model = todo
      @title = title
      @completed = completed
    end

    def call
      update_todo
      self
    end

    private

    def update_todo
      params = {}
      params[:title] = @title unless @title.nil?
      params[:completed] = @completed unless @completed.nil?

      @model.update(params)
    end
  end
end
