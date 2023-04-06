require_relative 'freight_train.rb'
require_relative 'passenger_train.rb'
require_relative 'route.rb'
require_relative 'station.rb'

class Train
  attr_reader :number, :type, :wagons, :route
  attr_accessor :current_speed
  
  def initialize(number, type, wagons)
    @number = number
    @type = type
    @wagons = wagons
    @current_speed = 0 
    @index = 0
  end
  
  def speed_up(speed)
    @current_speed += speed
    p "Your current speed: #{@current_speed}"
  end
  
  def stop
    @current_speed == 0
    p "Your current speed: #{@current_speed}"
  end
    
  def add_wagon
    if @current_speed == 0
      @wagons += 1
    else 
    p "Stop the fckn train, idiot!"
    end
  end
  
  def remove_wagon
    if @current_speed == 0 && wagons > 0
      @wagons -= 1
    else  
      p "Stop the fckn train, idiot!"
    end
  end
  
  def set_route(route)
    @route = route
    @current_station = @route[0]
    p "Your current station is #{@current_station}"
  end
  
  def next_station
    @index += 1
    @current_station = @route[@index]
    p "Current station is #{@current_station}"
  end
  
  def prev_station
    @index -= 1
    @current_station = @route[@index]
    p "Current station is #{@current_station}"
  end
  
  def prev_curr_next
    p "current: #{@route[@index]}"
    p "previous: #{route[@index - 1]}"
    p "next: #{route[@index + 1]}"
  end
end
  
train = Train.new(1488, "passenger", 8)
  
train.set_route(["Zavodskaya", "Vikulova", "Kraulya", "Radik"])
p train.route
train.next_station
train.prev_curr_next
p train
  
train.remove_wagon
  