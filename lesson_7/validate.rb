module Validate 
  def valid?
    validate!
  rescue RuntimeError
    false
  end
end
