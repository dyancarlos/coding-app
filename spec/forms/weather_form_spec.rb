require 'rails_helper'

RSpec.describe WeatherForm do
  it "extracts the postcode from address" do
    form = WeatherForm.new(address: "Av. Eunice Basso Sager, 769, Ibiaca, RS, Brasil")
    expect(form.postcode).to eq '99940-000'
  end

  it "does not returns postcode for invalid address" do
    form = WeatherForm.new(address: "invalid")
    expect(form.postcode).to be_nil
  end

  it "validates blank address" do
    form = WeatherForm.new(address: "")
    expect(form.valid?).to be_falsey
  end
end
