require_relative 'company_name.rb'
require_relative 'instance_counter.rb'

class Train
  @trains = {}

  include CompanyName
  include InstanceCounter

  attr_reader :name, :number, :wagons, :route
  attr_accessor :current_speed

  class << self
    def all
      @trains
    end
  
    def add_train(train)
      @trains[train.name] = train
    end
  
    def find(number)
      @trains.values.find { |t| t.number == number }
    end
  end
  
  def initialize(name, number)
    @name = name
    @number = number
    @wagons = []
    @current_speed = 0
    self.class.register_instance
  end
    
  def speed_up(speed)
    @current_speed += speed
    p "Your current speed: #{@current_speed}"
  end
  
  def stop
    @current_speed = 0
    p "Your current speed: #{@current_speed}"
  end
    
  def add_wagon(wagon)
    @wagons << wagon if @current_speed == 0 && @train_type == wagon.type
  end
  
  def remove_wagon(wagon)
    if @current_speed == 0 && @wagons.include?(wagon)
      @wagons.delete(wagon)
    else
      p "There's no wagons to remove!"
    end
  end
  
  def set_route(route)
    @route = route
    @current_station = route.stations[0]
    p "Route #{@route.name} has been set"
    p "Current station: #{@current_station.name}"
  end
  
  def send_to_next_station
    i = @route.stations.index(@current_station)

    if(s = @route.stations[i + 1]) 
      @current_station = s
      @route.stations[i].send_train(self)
      s.add_train(self)
      p "Current station is #{@current_station.name}"
    else
      p "This is a last station in the route"
    end
  end
  
  def send_to_prev_station
    i = @route.stations.index(@current_station)

    if(s = @route.stations[i - 1]) 
      @current_station = s
      @route.stations[i].send_train(self)
      s.add_train(self)
      p "Current station is #{@current_station.name}"
    else
      p "This is a first station in the route"
    end
  end
  
  def near_stations
    i = @route.stations.index(@current_station)
    p "current: #{@route.stations[i]&.name}"
    p "previous: #{@route.stations[i - 1]&.name}"
    p "next: #{@route.stations[i + 1]&.name}"
  end
end

Train.add_train(Train.new("t1", "1488"))
Train.add_train(Train.new("t2", "1337"))
