class Station 
  @@passenger_train = 0
  @@freight_train = 0

  def initialize(name)
    @name = name
  end
  
  def show_trains
    p "You have #{@@passenger_train + @@freight_train} trains on a station"
  end
  
  def add_freight_train
    @@freight_train += 1
    p "You added a freight_train"
  end

  def remove_freight_train
    @@freight_train -= 1
    p "You removed one freight train"
  end

  def add_passenger_train
    @@passenger_train += 1
    p "You added a passenger_train"
  end

  def remove_passenger_train
    @@passenger_train -= 1
    p "You removed one passenger train"
  end

  def show_types
    p "There's #{@@passenger_train} passenger trains and #{@@freight_train} freight trains on a station"
  end
end
  
class Train < Station
  def initialize(name)
    @name = name
  end
end
  
train = Train.new("train1")

train.add_freight_train
train.add_freight_train
train.add_freight_train
train.add_passenger_train
train.add_passenger_train

train.remove_freight_train
  
station = Station.new("station")
  
station.show_trains
station.show_types