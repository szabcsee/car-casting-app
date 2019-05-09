class UsersController < AuthenticationController 
  before_action :set_user, only: [:show, :update, :destroy]
  skip_before_action :authenticate, :only => [:get_current_user]

  # GET /users
  def index
    @users = User.all

    render json: @users
  end

  # GET /users/1
  def show
    render json: @user
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  def get_current_user
    @user = User.find_by access_token: params[:access_token]
    if @user
      render json: @user, status: :ok
    else
      render json: '{ message: "Token not found."}', status: :unauthorized
    end
  end

  def sso_login
    @user = User.find_by email: user_info['email']
        @user ? @user : @user = User.new
        #TODO: have to add much more from API data. Currently only can access the basics.
        @user.name = "#{user_info['given_name']} #{user_info['family_name']}"
        @user.access_token = token_data['access_token']
        @user.access_token_created_at = Time.zone.now
        @user.token_data = response.body
        @user.save
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:name, :email, :password, :phone, :address, :center, :status, :access_token, :token_data, :buzzer, :lock)
    end
end
