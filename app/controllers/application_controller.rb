class ApplicationController < ActionController::Base
  before_action :set_locale

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def change_locale
    I18n.locale = params[:locale]
    redirect_back(fallback_location: root_path)  # Volta para a página anterior após alterar o idioma
  end
end
