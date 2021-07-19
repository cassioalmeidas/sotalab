class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :set_locale

  def default_url_options
    { locale: I18n.locale }
  end

  def set_locale
    I18n.locale = params[:locale] || extract_locale_from_accept_language_header
  end


  private
    def extract_locale_from_accept_language_header
      accept_language = request.env['HTTP_ACCEPT_LANGUAGE'] || ""
      accept_language.match(/^[a-z]{2}(-[A-Z]{2})?/)[0]
    end
end
