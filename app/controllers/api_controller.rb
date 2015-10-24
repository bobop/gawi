class ApiController < ApplicationController

  layout false

  # /api/weather?lat=....&long=...
  def weather
    if params[:lat].present? && params[:long].present?
      ws = WeatherService.new(params[:lat], params[:long])
      @weather = ws.five_day_forecast
    end
  end
  
  # /api/bacon?neighbourhood=<neighbourhood.id>
  def bacon
    if params[:neighbourhood].present?
      @fuzz =  JSON.parse(HTTParty.get("https://data.police.uk/api/greater-manchester/#{params[:neighbourhood]}/people").body)
    else
      @fuzz =  JSON.parse(HTTParty.get("https://data.police.uk/api/greater-manchester/A1/people").body)
    end
  end

end