class ProjectsController < ApplicationController
  # rescue_from ActionController::InvalidAuthenticityToken, with: :unauthorized
  before_action :set_project, only: %i[show edit update destroy]
  before_action -> { contains_filtered_word?(params[:title]) || contains_filtered_word?(params[:description]) }, only: %i[show edit update destroy]
  skip_before_action :authorize, only: [:index, :show]
  
  # GET /projects or /projects.json
  def index
    projects = Project.all
    render json:  projects.as_json(include: :user) 
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

  # POST /projects or /projects.json
  def create
    # Check for profanity in the title and description
  if !@current_user || !@current_user.is_admin?
    render json: { errors: "no authorize to create" }, status: :unprocessable_entity
    else
    

    if contains_filtered_word?(params[:title]) || contains_filtered_word?(params[:description])
      render json: { errors: "Project contains a filtered word and cannot be created" }, status: :unprocessable_entity
      return
    end

    project = Project.create(

      user_id: params[ :user_id],
      title: params[:title],
      description: params[:description],
      is_public: params[:is_public],
      is_featured: params[:is_featured],
      view_count: params[:view_count]
    )
    # project.user_id = @current_user.id

    if project.valid?
      render json: project, status: :created
    else
      render json: { errors: project.errors.full_messages }, status: :unprocessable_entity
    end
  end
end
  # PATCH/PUT /projects/1 or /projects/1.json
  def update
    project = Project.find_by(id: params[:id])

    if project
      # Check for profanity in the updated title and description
      if contains_filtered_word?(params[:title]) || contains_filtered_word?(params[:description])
        render json: { errors: "Project contains a filtered word and cannot be updated" }, status: :unprocessable_entity
        return
      end

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

  #  archive project

   def archive
    project = Project.find_by(id: params[:id])

    if project
      # Check for profanity in the updated title and description
      
      if contains_filtered_word?(params[:title]) || contains_filtered_word?(params[:description])
        render json: { errors: "Project contains a filtered word and cannot be updated" }, status: :unprocessable_entity
        return
      end

      if project.delete_after_sometimes
        render json: project, status: :created
      else
        render json: { errors: project.errors.full_messages }, status: :unprocessable_entity
      end
    else
      render json: { errors: "Project not found" }, status: :not_found
    end
  end

  # DELETE /projects/1 or /projects/1.json

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

  # Check for profanity using the 'profanity-filter' gem
  # Check for profanity using the 'profanity-filter' gem
    def contains_filtered_word?(text)
      filtered_words = FilteredWord.pluck(:word)
      text_words = text.to_s.downcase.split

      # Check if any of the words in 'text_words' are in the 'filtered_words' array
      text_words.each do |word|
        return true if filtered_words.include?(word)
      end

      false
    end
 

  # def unauthorized
  #   render json: { "error": "not authorized" }, status: :unauthorized
  # end

end
