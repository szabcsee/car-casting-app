class AuthenticationController < ApplicationController

  # Authenticate the user with token based authentication
  def authenticate
    
  end

  def render_unauthorized(realm = "Application")
    self.headers["WWW-Authenticate"] = %(Token realm="#{realm.gsub(/"/, "")}")
    render json: 'Bad credentials', status: :unauthorized
  end

  def logout
    @user = User.find_by email: params[:email]
    if @user
      @user.jwt_token = nil
      @user.jwt_token_created_at = nil
      render json: '{ message: "You have been sucessfully logged out."}', status: :ok
    else
      render json: '{ message: "Token not found."}', status: :unauthorized
    end
  end

  def login
    
  end
end
