class ApiController < ApplicationController
  # /api/weather?lat=....&long=...
  def weather
    if params[:lat].present? && params[:long].present?
      weather = WeatherService.new(params[:lat], params[:long])
    end
  end
  
  def bacon
    #{params[:neighbourhood]}
    @fuzz =  JSON.parse(HTTParty.get("https://data.police.uk/api/greater-manchester/A1/people").body)
  end
  
end