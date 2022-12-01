class ApplicationController < ActionController::Base

  before_action def set_locale
    if session[:locale].present?
      logger.info "Setting locale to #{session[:locale]}"
      I18n.locale = session[:locale]
    else
      I18n.locale = :en
    end
  end

end
