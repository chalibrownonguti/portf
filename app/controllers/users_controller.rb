class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]
   skip_before_action :authorize, only: [:create]
    
  # GET /users or /users.json
 def index
  users = User.all
  render json: { users: users.as_json(only: [:id, :name, :profile_image, :gender, :date_of_birth]) }
end

  # GET /users/1 or /users/1.json
  def show
    user = User.find_by(id: params[:id])

    if user
      render json: user
    else
      render json: { error: "User not found" }, status: :not_found
    end
  end


    #session signedin

    def signedin_user
      user = User.find_by(id: session[:user_id])
      if user
        render json: user
      else
        render json: {error: "not signedin"}, status: :not_found
      end
    end
    
  # POST /users or /users.json
  def create
    user = User.create(
      name: params[:name],
      profile_image: params[:profile_image],
      gender: params[:gender],
      date_of_birth: params[:date_of_birth],
      password: params[:password],
      password_confirmation: params[:password_confirmation],
      email: params[:email]
    )

    if user.valid?
      
      render json: user, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end
  # Other controller actions and methods
def update
  user = User.find_by(id: params[:id])
 
  puts "Params received for update: #{params.inspect}" # Add this line for debugging

  if user.update(
    name: params[:name],
    profile_image: params[:profile_image],
    gender: params[:gender],
    date_of_birth: params[:date_of_birth],
    password: params[:password],
    password_confirmation: params[:password_confirmation],
    email: params[:email]
  )
    puts "User successfully updated: #{user.inspect}" # Add this line for debugging
    render json: user, status: :ok
  else
    puts "Error updating user: #{user.errors.full_messages}" # Add this line for debugging
    render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
  end
end



  private


  def set_user
    @user = User.find(params[:id])
  end


  def user_params
    params.require(:user).permit(:name, :is_admin, :profile_image, :gender, :date_of_birth, :password, :password_confirmation, :email)
  end
end
           