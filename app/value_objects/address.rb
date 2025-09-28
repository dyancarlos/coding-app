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
    OpenStruct.new(geocoder_search&.fetch("address"))
  end

  def geocoder_search
    geocoder = Geocoder.search(@address).first
    if geocoder
      geocoder.data
    end
  end
end
