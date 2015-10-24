class ApiController < ApplicationController
  layout false

  # /api/weather?lat=....&long=...
 
  def weather
    if params[:lat].present? && params[:long].present?
      ws = WeatherService.new(params[:lat], params[:long])
      @weather = ws.five_day_forecast
    end
  end
  
  def bacon
    if params[:neighbourhood].present?
      @fuzz =  JSON.parse(HTTParty.get("https://data.police.uk/api/greater-manchester/#{params[:neighbourhood]}/people").body)
    else
      @fuzz =  JSON.parse(HTTParty.get("https://data.police.uk/api/greater-manchester/A1/people").body)
    end
  end
  
  def place
    if params[:neighbourhood_name].present?
      @places =  HTTParty.get("http://en.wikipedia.org/w/api.php?format=json&action=query&prop=extracts&exintro=&explaintext=&titles=#{params[:neighbourhood_name]}", verify: false)
    else
      @places =  HTTParty.get("http://en.wikipedia.org/w/api.php?format=json&action=query&prop=extracts&exintro=&explaintext=&titles=manchester",verify: false)
    end
    if @places.code == 200
      @discription = @places["query"]["pages"][@places["query"]["pages"].keys.first]["extract"]
    else
      @discription = " "
    end
  end
  
  def this_little_piggy_went_to_market
    if params[:neighbourhood].present?
      @fuzz_parties =  JSON.parse(HTTParty.get("https://data.police.uk/api/greater-manchester/#{params[:neighbourhood]}/events").body)
    else
      @fuzz_parties =  JSON.parse(HTTParty.get("https://data.police.uk/api//api/leicestershire/C01/events").body)
    end
  end

end