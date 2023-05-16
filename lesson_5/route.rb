class Route
  @routes = {}

  attr_reader :stations, :name

  def self.all_routes
    @routes
  end

  def self.add_route(route)
    @routes[route.name] = route
  end

  def initialize(name, starting, ending)
    @name = name
    @stations = [starting, ending]
  end

  def show_stations
    @stations.each { |s| p s }
  end

  def add_station(index, station)
    @stations.insert(index, station)
  end
    
  def remove_station(station)
    @stations.delete(station)
  end
end