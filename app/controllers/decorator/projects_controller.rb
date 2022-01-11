module Decorator
  class ProjectsController < DecoratorController
    def index
      @projects = Project.all.decorate
    end
  end
end