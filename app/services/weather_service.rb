require "ostruct"

class WeatherService
  URL = "http://api.openweathermap.org/data/2.5/weather".freeze
  KEY = "3b8cfbb149f0a98c5865c82b518ab8dd".freeze

  def initialize(postcode)
    @postcode = postcode
  end

  def call
    response = fetch_forecast

    if response.key?("main")
      SuccessService.new(object: OpenStruct.new(response["main"]))
    else
      ErrorService.new(object: response["message"])
    end
  end

  private

  def fetch_forecast
    HTTParty.get(URL, query: forecast_params)
  end

  def forecast_params
    {
      zip: @postcode,
      units: "metrics",
      appid: KEY
    }
  end
end
