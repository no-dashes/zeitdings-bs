class DashboardController < ApplicationController

  def index
    @time = Time.now.strftime("%d.%m.%Y %H:%M")
  end

  def foo
    @title = "fuuuu"
    @greeting = "Hallo zusammen!"
  end

  def switch_locale
    loc = params[:locale]
    I18n.locale = loc
    session[:locale] = loc
    redirect_to root_path
  end

end
