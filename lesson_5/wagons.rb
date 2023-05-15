class Wagons
  attr_reader :name, :type
  include CompanyName
  
  def initialize(name, type)
    @name = name
    @type = type
  end
end