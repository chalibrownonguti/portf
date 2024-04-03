class SessionController < ApplicationController
   
    skip_before_action :authorize, only: [:signin]

     def signin
      name = params[:name]
      email = params[:email]
      password = params[:password]

      # puts "Name: #{name}"
      # puts "Password: #{password}"

      user = User.find_by(name: name, email: email)
       puts "User: #{user.inspect}"

      if user && user.authenticate(password)
         session[:user_id]=user.id
         
         render json: { success: "signin success" }
      else
         # puts "Authentication failed for user: #{user.inspect}"
         render json: { error: "wrong username/password" }
     end
   end


   def signout
     session.delete :user_id
     render json: {success: "signout success"} 
   end

end


# class SessionController < ApplicationController
#   skip_before_action :authorize, only: [:signin]

#   def signin
#     user = User.find_by(email: params[:email])
#     if user && user.authenticate(params[:password])
#       session[:user_id] = user.id
#       render json: { success: "signin success" }, status: :ok
#     else
#       render json: { error: "Invalid email or password" }, status: :unauthorized
#     end
#   end

#   def signout
#     session.delete(:user_id)
#     render json: { success: "signout success" }, status: :ok
#   end

#   private

#   def session_params
#     params.permit(:email, :password)
#   end
# end

