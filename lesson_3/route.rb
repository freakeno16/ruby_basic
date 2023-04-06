class Route
  def initialize(starting, ending)
    @starting = starting
    @ending = ending
    @stations = [@starting, @ending]
  end

  def show_stations
    p @stations
  end

  def add_station(index, station)
    @stations.insert(index, station)
  end
    
  def remove_station(station)
    @stations.delete(station)
  end
end

route = Route.new("Zavodskaya", "Radik")
route.show_stations

route.add_station(-2, "Vikulova")
route.show_stations