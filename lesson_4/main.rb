require_relative 'train.rb'
require_relative 'passenger_train.rb'
require_relative 'freight_train.rb'
require_relative 'station.rb'
require_relative 'route.rb'

@routes = []
@trains = []
@stations = []

def handle_user_command

  command = gets.chomp

  case command

  when "create new station"
    create_new_station

  when "create new train"
    create_new_train

  when "route menu"
    route_menu

  when "train set route"
    train_set_route

  when "train add wagon"
    train_add_wagon
  
  when "train remove wagon"
    train_remove_wagon
  
  when "train move"
    train_move

  when "show stations and trains"
    show_stations_and_trains
  end
end

def create_new_station
  p "Enter name of new station: "
 
  station_name = gets.chomp

  @stations.push(Station.new station_name)
 
  p "Stations: #{@stations.map { |s| s.name }}"
end

def create_new_train
  p "Enter name of new train: "
  train_name = gets.chomp

  p "Enter number of new train: "
  train_number = gets.chomp

  p "Enter train type: "
  train_type = gets.chomp

  # if Train::TRAIN_TYPES.include?(train_type)
  #   t = Object.const_get("#{train_type.capitalize}Train").new(train_name, train_number)
  #   @trains.push(t)
  #   p "Trains: #{@trains.map{ |t| t.name } }"
  # else
  #  p "Error"
  # end 

  case train_type 
  when PASSENGER
    @trains.push(PassengerTrain.new(train_name, train_number))
    p "Trains: #{@trains.map{ |t| t.name } }" 
  when FREIGHT
    @trains.push(FreightTrain.new(train_name, train_number))
    p "Trains: #{$trains.map{ |t| t.name } }" 
  else
    p "Error!"
  end
end

def route_menu
  p "Enter 'new' to create new station"
  p "Enter 'choose' to manage"
  route_choice = gets.chomp

  case route_choice
  when "new"
    p "Enter name of new route: "
    route_name = gets.chomp
    p "Enter name of first station: "
    first_station = gets.chomp
    p "Enter name of last station: "
    last_station = gets.chomp
    
    Route.new(route_name, first_station, last_station)
    @routes.push(route_name)
    p "Routes: #{@routes.map{ |r| r.name } }"

  when "choose"
    p "Enter 'add'/'remove' to manage"
    route_choice = gets.chomp

  case route_choice
  when "add"
    p "Enter route name that you want to change: "
    route_name = gets.chomp

    p "Enter name of station that you want to add: "
    station_name = gets.chomp

    p "Where do you want to add station?: "
    index = gets.to_i

    route_name.add_station(index, station_name)
    p @routes
  
  when "remove"
    p "Enter name of route that you want to change: "
    route_name = gets.chomp

    p "Enter name of station that you want to remove: "
    station_name = gets.chomp

    route_name.remove_station(station_name)
    p route_name
  
    else p "Error!"
    end
  end
end

def train_set_route
  p "Enter train name for set route: "
  train_name = gets.chomp

  p "Enter name of route: "
  route_name = gets.chomp

  train_name.set_route(route_name)
  p @routes
  p "Your current station is #{route_name.stations[0]}"
end

def train_add_wagon
  p "Enter train name: "
  train_name = gets.chomp

  p "Enter type of wagon: "
  wagon_type = gets.chomp
  
  if wagon_type == train_name.train_type then train_name.add_wagon(wagon_type)
    p "Wagon was added to #{train_name} train"
    p train_name
  else p "Wrong type of wagon!"
  end
end

def train_remove_wagon
  p "Enter train name: "
  train_name = gets.chomp

  p "Enter wagon index: "
  index = gets.to_i

  @train_class_name.remove_wagon(index)
  p "Wagon was removed from #{train_name} train"
end

def train_move
  p "Where do you want to move (forward/back)?"
  train_move = gets.chomp

  case train_move
  
  when "forward"
    p "Enter train name: "
    train_name = gets.chomp

    train_name.next_station

  when "back"
    p "Enter train name: "
    train_name = gets.chomp

    train_name.prev_station
  end
end

def show_stations_and_trains
  p "Enter route name: "
  route_name = gets.chomp

  route_name.show_stations

  p "Enter name of station: "
  station_name = gets.chomp

  p station_name.trains
end

loop do 
  p "Choose your destiny: "
  handle_user_command
  p "print 'exit' if you want to stop"
  break if gets.chomp == "exit"
end
