class ProjectsController < ApplicationController
    before_action :set_project, only: %i[ show edit update destroy ]

    # GET /projects or /projects.json
    def index
      projects = Project.all
      render json: {projects: projects}
    end

    # GET /projects/1 or /projects/1.json
  def show
    project = Project.find_by(id: params[:id])

    if project
      render json: project
    else
      render json: { error: "Project not found" }, status: :not_found
    end
  end

  #   # GET /projects/new
  #   def new
  #     @project = Project.new
  #   @projects = Project.all
  # end
  #   # GET /projects/1/edit
  #   def edit
  #   end

    # POST /projects or /projects.json
  def create
    project = Project.new(
      title: params[:title],
      description: params[:description],
      is_public: params[:is_public],
      is_featured: params[:is_featured],
      view_count: params[ :view_count]
    )

    if project.save
      render json: project, status: :created
    else
      render json: { errors: project.errors.full_messages }, status: :unprocessable_entity
    end
  end


    # PATCH/PUT /projects/1 or /projects/1.json
  def update
    project = Project.find_by(id: params[:id]) # Use find_by to handle the case where the project is not found

    if project
      if project.update(
        title: params[:title],
        description: params[:description],
        is_public: params[:is_public],
        is_featured: params[:is_featured],
        view_count: params[:view_count]
      )
        render json: project, status: :created
      else
        render json: { errors: project.errors.full_messages }, status: :unprocessable_entity
      end
    else
      render json: { errors: "Project not found" }, status: :not_found
    end
  end




    # # DELETE /projects/1 or /projects/1.json
def destroy
  project = Project.find_by(id: params[:id])

  if project
    if project.destroy
      render json: { message: "Project successfully deleted" }, status: :no_content
    else
      render json: { errors: project.errors.full_messages }, status: :unprocessable_entity
    end
  else
    render json: { errors: "Project you're trying to delete does not exist" }, status: :not_found
  end
end


    private
      # Use callbacks to share common setup or constraints between actions.
      def set_project
        @project = Project.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def project_params
        params.require(:project).permit(:title, :description, :is_public, :is_featured, :view_count)
      end
end
