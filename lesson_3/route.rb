class Route
  attr_reader :stations, :name
  def initialize(name, starting, ending)
    @name = name
    @starting = starting
    @ending = ending
    @stations = [@starting, @ending]
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
