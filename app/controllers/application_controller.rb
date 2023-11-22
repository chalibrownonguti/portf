class ApplicationController < ActionController::API
  include ActionController::Cookies
  before_action :authorize 

  private
  
   def authorize
    current_user= User.find_by(id: session[:user_id])
        if !current_user
            
            render json: {"error": "not authorized"}
        end
    
   end
end

# class ApplicationController < ActionController::API
#   include ActionController::Cookies
#   before_action :authorize 

#   class NotAuthorizedError < StandardError; end

#   def authorize
#     current_user = User.find_by(id: session[:user_id])
#     raise NotAuthorizedError.new("Not authorized") if current_user.nil?
#   end

#   rescue_from NotAuthorizedError, with: :unauthorized

#   private

#   def unauthorized
#     render json: { "error": "not authorized" }, status: :unauthorized
#   end
# end

