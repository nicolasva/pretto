module Service
  module Api
    module V1
      class ProjectsController < ServiceController
        def index
          #@projects = Project.all
          @projects = ProjectService.call(Project.all)
        end
      end
    end
  end
end