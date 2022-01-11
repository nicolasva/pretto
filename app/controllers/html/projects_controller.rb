module Html
  class ProjectsController < HtmlController
    def index
      @projects = ProjectService.call(Project.all)
    end
  end
end