class HomeController < ApplicationController

  def index
  end

  def configure_locale
      locale = params[:locale] || session[:locale] || I18n.locale || cookies[:locale] || I18n.default_locale
      session[:locale] = locale
      redirect_back fallback_location: root_url
  end
end
