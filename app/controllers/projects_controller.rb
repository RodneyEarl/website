class ProjectsController < ApplicationController

  before_action :admin_user, only: [:new, :create]

  def index
    @newProject = Project.new if user_signed_in? && current_user.admin?
    @items = Project.paginate(page: params[:page])
  end

  def new
    @newProject = Project.new
  end

  def create
    if user_signed_in? && current_user.admin?
      @newProject = Project.new(project_params)
      if @newProject.save
        flash[:success] = "Project created!"
        redirect_to '/projects'
      else
        render 'projects/index'
      end
    end
  end

  private

    def project_params
      params.require(:project).permit(:title, :content, :avatar)
    end

    # Before filters

    def admin_user
      redirect_to(project_path) unless current_user.admin?
    end
end
