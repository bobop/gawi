class WeatherService < BaseService


  def new(lat, long)
    @lat = lat
    @long = long
  end

  def current_weather
    response = HTTParty.get("http://api.openweathermap.org/data/2.5/weather?lat=#{@lat}&lon=#{@lon}")
    result = Hashie::Mash.new(Json.parse(response.body))
    if result.weather?
      return result.weather
    end
    nil
  end
end