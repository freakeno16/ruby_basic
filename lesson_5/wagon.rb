require_relative 'company_name.rb'

class Wagon
  @wagons = {}

  include CompanyName

  attr_reader :name, :type

  class << self 
    def all
      @wagons
    end
  
    def add_wagon(wagon)
      @wagons[wagon.name] = wagon
    end
  end
  
  def initialize(name, type)
    @name = name
    @type = type
  end
end