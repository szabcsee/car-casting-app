class HomeController < ApplicationController

  def index
  end

  def set_locale
    locale = params[:locale] || I18n.locale || cookies[:locale] || I18n.default_locale
    session[:locale] = locale
    I18n.locale = locale.to_sym
    redirect_back fallback_location: root_url
  end
end
