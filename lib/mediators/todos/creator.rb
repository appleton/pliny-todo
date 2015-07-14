module Mediators::Todos
  class Creator < Mediators::Base
    attr_reader :model

    def initialize(user:, title:, completed: false)
      @user      = user
      @title     = title
      @completed = !!completed
    end

    def call
      @model = Todo.create(
        user:      @user,
        title:     @title,
        completed: @completed
      )
      self
    end
  end
end
