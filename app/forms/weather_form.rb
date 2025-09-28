class WeatherForm
  include ActiveModel::Model

  attr_accessor :address

  validates :address, presence: true

  def postcode
    full_address.postcode
  end

  private

  def full_address
    @full_address ||= Address.new(address)
  end
end
