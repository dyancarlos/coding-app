class WeathersController < ApplicationController
  def new
    @form = WeatherForm.new
  end

  def create
    @form = WeatherForm.new(weather_form)

    respond_to do |format|
      format.turbo_stream
    end
  end

  private

  def weather_form
    params.require(:weather_form).permit(:address)
  end
end
