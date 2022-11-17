class DashboardController < ApplicationController

  def index
    @time = Time.now.strftime("%d.%m.%Y %H:%M")
  end

  def foo
    @title = "fuuuu"
    @greeting = "Hallo zusammen!"
  end

end
