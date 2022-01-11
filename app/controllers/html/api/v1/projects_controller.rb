module Html
  module Api
    module V1
      class ProjectsController < HtmlController
        def index
          #@projects = Project.all
          @projects = ProjectService.call(Project.all)
        end
      end
    end
  end
end