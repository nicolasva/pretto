module Service
  class ProjectsController < ServiceController
    def index
      @projects = ProjectService.call(Project.all)
    end
  end
end