require "ostruct"

class Address
  def initialize(address)
    @address = address
  end

  def postcode
    address_object.postcode
  end

  private

  def address_object
    OpenStruct.new(geocoder_search["address"])
  end

  def geocoder_search
    Geocoder.search(@address).first.data
  end
end
