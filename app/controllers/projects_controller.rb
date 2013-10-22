class ProjectsController < ApplicationController

  before_action :admin_user, only: [:create]

  def index
    @newProject = Project.new if user_signed_in? && current_user.admin?
    @items = Project.paginate(page: params[:page])
  end

  def create
    if user_signed_in? && current_user.admin?
      @newProject = Project.new(project_params)
      if @newProject.save
        flash[:success] = "Project created!"
        redirect_to '/projects'
      else
        redirect_to '/projects'
      end
    end
  end

  private

    def project_params
      params.require(:project).permit(:title, :content, :avatar)
    end

    # Before filters

    def admin_user
      redirect_to('/projects') unless user_signed_in? && current_user.admin?
    end
end
