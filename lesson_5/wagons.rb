class Wagons
  @wagons = {}

  include CompanyName

  attr_reader :name, :type

  def self.all_wagons
    @wagons
  end

  def self.add_wagon(wagon)
    @wagons[wagon.name] = wagon
  end
  
  def initialize(name, type)
    @name = name
    @type = type
  end
end