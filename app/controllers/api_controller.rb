class ApiController < ApplicationController

  # /api/weather?lat=....&long=...
  def weather
    if params[:lat].present? && params[:long].present?
      ws = WeatherService.new(params[:lat], params[:long])
      @weather = ws.five_day_forecast
    end
  end


end