class SessionController < ApplicationController
   
    skip_before_action :authorize, only: [:signin]

     def signin
      name = params[:name]
      password = params[:password]

      # puts "Name: #{name}"
      # puts "Password: #{password}"

      user = User.find_by(name: name)
      #  puts "User: #{user.inspect}"

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
