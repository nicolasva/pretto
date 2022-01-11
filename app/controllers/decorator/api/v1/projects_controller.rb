module Decorator
  module Api
    module V1
      class ProjectsController < DecoratorController
        def index
          @projects = Project.all.decorate
        end
      end
    end
  end
end