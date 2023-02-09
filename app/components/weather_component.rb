# frozen_string_literal: true

class WeatherComponent < ViewComponent::Base

  def initialize(name)
    @name = name
    @weather = ['gut', 'besser', 'meh'].shuffle.first
  end

end
