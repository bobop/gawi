class WeatherService < BaseService


  def initialize(lat, long)
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

  def five_day_forecast
    response = HTTParty.get("http://api.openweathermap.org/data/2.5/forecast/daily?lat=#{@lat}&lon=#{@long}&cnt=5&mode=json&appid=d4b5dd7091625572645be408269bb6c5")
    result = Hashie::Mash.new(JSON.parse(response.body))
    if result.list?
      return result.list
    end
    nil
  end
end