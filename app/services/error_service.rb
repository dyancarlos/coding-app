class ErrorService < Struct.new(:object)
  def success?
    false
  end
end
