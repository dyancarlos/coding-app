require 'rails_helper'

RSpec.describe WeatherService do
  it "returns the weather forecast for a valid postcode" do
    service = WeatherService.new(10001).call

    expect(service.success?).to be true
    expect(service.object.temp).not_to be_blank
  end

  it "returns error message for an invalid postcode" do
    service = WeatherService.new("invalid").call

    expect(service.success?).to be_falsey
    expect(service.object).to eq "city not found"
  end
end
