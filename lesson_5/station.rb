class Station 
  @stations = {}

  attr_reader :trains, :name

  def self.all_stations
    @stations
  end

  def self.add_station(station)
    @stations[station.name] = station
  end

  def initialize(name)
    @name = name
    @trains = []
  end
  
  def add_train(train)
    @trains << train
  end

  def send_train(train)
    @trains.delete(train)
  end

  def trains_by_type(type)
    @trains.select { |t| t.type == type }
  end
end