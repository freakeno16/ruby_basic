class Wagon
  @wagons = {}

  include CompanyName

  attr_reader :name, :type

  class << self 
    def all_routes
      @routes
    end
  
    def add_route(route)
      @routes[route.name] = route
    end
  end
  
  def initialize(name, type)
    @name = name
    @type = type
  end
end