class Station 
  attr_reader :trains

  def initialize(name)
    @name = name
    @trains = []
    @passenger_train = 0
    @freight_train = 0
  end
  
  def add_train(type)
    if type == "passenger"
      @trains << type
      @passenger_train += 1

    elsif type == "freight"
      @trains << type
      @freight_train += 1
    end
  end

  def remove_train(index)
    @trains.delete_at(index)
  end

  def train_types
    p "passenger trains: #{@passenger_train}"
    p "freight trains: #{@freight_train}"
  end
end

station = Station.new("Station")

station.add_train("passenger")
station.add_train("freight")
station.add_train("passenger")
station.add_train("freight")

p station.trains
station.train_types