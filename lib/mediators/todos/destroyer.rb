module Mediators::Todos
  class Destroyer < Mediators::Base
    attr_reader :model

    def initialize(todo:)
      @model = todo
    end

    def call
      @model.destroy
      self
    end
  end
end
