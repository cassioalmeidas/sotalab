class ProjectsController < ApplicationController
  before_action :set_project, only: %i[ show edit update destroy ]

  add_breadcrumb proc { I18n.t('home') }, :root_path 
  add_breadcrumb proc { Project.model_name.human(count: 2) }, :projects_path 
  # GET /projects or /projects.json
  def index
    @projects = current_user.projects.all
    respond_to do |format|
      format.html
      format.json { render json: ProjectDatatable.new(params) }
    end
  end

  # GET /projects/1 or /projects/1.json
  def show
    add_breadcrumb proc { @project.name }, project_path(@project) 
  end

  # GET /projects/new
  def new
    add_breadcrumb proc { t('.title') }, new_project_path(@project) 
    @project = Project.new
  end

  # GET /projects/1/edit
  def edit
    add_breadcrumb proc { t('.title') }, edit_project_path(@project) 
  end

  # POST /projects or /projects.json
  def create
    @project = Project.new(project_params)
    @project.user = current_user
    respond_to do |format|
      if @project.save
        format.html { redirect_to projects_url, notice: t('.success') }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1 or /projects/1.json
  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to projects_url, notice: t('.success') }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1 or /projects/1.json
  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: t('.success') }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def project_params
      params.require(:project).permit(:user_id, :name, :description)
    end
end
