class AuthenticationController < ApplicationController

  # Authenticate the user with token based authentication
  def authenticate
    if OAUTH_CONFIG['sso_login'] == 'true'
        # This process is for SSO Login
        authenticate_token || render_unauthorized
    else
        # here comes the regular login.
    end
  end

  def authenticate_token
    authenticate_with_http_token do |token, options|
      @current_user = User.where(access_token: token).first

      if !@current_user
        return false
      end

      token_data = JSON.parse(@current_user.token_data)

      if Time.zone.now <= @current_user.access_token_created_at + token_data['expires_in'].seconds
          return true
      end

      uri = URI.parse(OAUTH_CONFIG['sso_uri'] + 'tokeninfo/?access_token=' + token)
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      http.set_debug_output($stdout)
      response = http.request_get(uri.to_s)
      if response.header.code == '200'
        token_status = JSON.parse(response.body)
        #TODO: Maybe we should do something with this info later on
        return true
      else
        render json: {message: response.header.message}, status: response.header.code
      end
    end
  end

  def request_token(authorization_code)
    parameters = {
        'grant_type' => 'authorization_code',
        'client_id' => OAUTH_CONFIG['client_id'],
        'redirect_uri' => OAUTH_CONFIG['redirect_uri'],
        'client_secret' => OAUTH_CONFIG['client_secret'],
        'code' => authorization_code
    }
    uri = URI.parse(OAUTH_CONFIG['sso_uri'] + 'token/')

    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    req = Net::HTTP::Post.new(uri)
    req.content_type = "application/x-www-form-urlencoded"
    data = URI.encode_www_form(parameters)
    req.body = data
    return http.request(req)
  end

  def render_unauthorized(realm = "Application")
    self.headers["WWW-Authenticate"] = %(Token realm="#{realm.gsub(/"/, "")}")
    render json: 'Bad credentials', status: :unauthorized
  end

  def logout
    @user = User.find_by email: params[:email]
    if @user
      @user.access_token = nil
      @user.access_token_created_at = nil
      render json: '{ message: "You have been sucessfully logged out."}', status: :ok
    else
      render json: '{ message: "Token not found."}', status: :unauthorized
    end
  end

  def sso_login
    if params[:code]
      response = request_token(params[:code])

      if response.header.code == '200'
        token_data = JSON.parse response.body

        user_info  = JWT.decode(token_data['id_token'],nil,false).first
        ApplicationController.sso_login(user_info)
        redirect_to("/?access_token=#{token_data['access_token']}")
      else
        redirect_to('/', status: response.header.code, alert: response.header.message)
      end
    elsif params[:error]
      redirect_to('/', status: 401, alert: params[:error])
    end
  end

  def login
    
  end

  def get_sso_login_url
    login_path = {
        'uri' => OAUTH_CONFIG['sso_uri'] + "authorize/?scope=openid+profile+email+role&response_type=code&display=page&client_id=#{OAUTH_CONFIG['client_id']}&redirect_uri=#{OAUTH_CONFIG['redirect_uri']}"
    }
    render json: login_path, status: :ok
  end
end
