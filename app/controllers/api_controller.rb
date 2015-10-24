class ApiController < ApplicationController

  # /api/weather?lat=....&long=...
  def weather
    if params[:lat].present? && params[:long].present?
      weather = WeatherService.new(params[:lat], params[:long])
    end
  end

  
end