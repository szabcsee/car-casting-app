# :nodoc:
class ApplicationController < ActionController::Base
  before_filter :set_gettext_locale
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:admin, :first_name, :last_name])
  end

  def authorize_user
    if current_user.nil? || !current_user.admin
      @error = {
          title: 'Authorization Error',
          body: 'You need admin rights to access this page'
      }
      redirect_to error_page_path(@error), error: 'You need admin rights to access this page.'
    end
  end
end
