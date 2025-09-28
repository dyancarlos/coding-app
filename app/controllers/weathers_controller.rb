class WeathersController < ApplicationController
  def new
    @form = WeatherForm.new
  end

  def create
    @form = WeatherForm.new(weather_form)

    if @form.valid?
      @service = WeatherService.new(@form.postcode).call

      respond_to do |format|
        format.turbo_stream
      end
    else
      render :new
    end
  end

  private

  def weather_form
    params.require(:weather_form).permit(:address)
  end
end
