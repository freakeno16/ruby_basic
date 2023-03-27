class Route
  def initialize(starting, ending)
    @starting = starting
    @ending = ending
    @stations = [@starting, @ending]
  end

  def show_stations
    p @stations
  end

  def add_station(station)
    @stations.insert(-2, station)
  end
    
  def remove_station(station)
    @stations.delete(station)
  end
end

route = Route.new("Zavodskaya", "Radik")
route.show_stations

route.add_station("Vikulova", 1)
route.add_station("Kraulya", 2)
route.show_stations
route.remove_station(2) 
route.show_stations