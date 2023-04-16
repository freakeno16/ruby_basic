require_relative 'main_train.rb'
require_relative 'passenger_train.rb'
require_relative 'freight_train.rb'
require_relative 'station.rb'
require_relative 'route.rb'

$routes = []
$trains = []

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
  
  when "train_remove_wagon"
    train_remove_wagon
  
  when "train move"
    train_move

  when "show stations and trains"
    show_stations_and_trains
  end
end

def create_new_station
  p "Enter class name of new station: "
  station_class_name = gets.chomp

  p "Enter name of new station: "
  station_name = gets.chomp

  station_class_name = Station.new(station_name)
  p station_class_name
end

def create_new_train
  p "Enter name of new train: "
  train_name = gets.chomp

  p "Enter class name of new train: "
  train_class_name = gets.chomp

  p "Enter number of new train: "
  train_number = gets.chomp

  p "Enter type of new train: "
  train_type = gets.chomp

  case train_type 

  when "passenger"
   @train_class_name = PassengerTrain.new(train_name, train_number)

   $trains.each do |i|
    if i.name == train_name
      @train_class_name = i
    end
  end

   $trains.push(@train_class_name)
   p "Trains: #{$trains}"

  when "freight"
    @train_class_name = FreightTrain.new(train_name, train_number)

    $trains.each do |i|
      if i.name == train_name
        @train_class_name = i
      end
    end  

    $trains.push(@train_class_name)
    p "Trains: #{$trains}" 

  else p "Error!"
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
    p "Enter class name of new route: "
    @route_class_name = gets.chomp
    p "Enter name of first station: "
    first_station = gets.chomp
    p "Enter name of last station: "
    last_station = gets.chomp
    
    @route_class_name = Route.new(route_name, first_station, last_station)
    $routes.push(@route_class_name)
    p "Routes: #{$routes}"

  when "choose"
    p "Enter 'add'/'remove' to manage"
    route_choice = gets.chomp

  case route_choice
    when "add"
    p "Enter route name that you want to change: "
    route_name = gets.chomp

    $routes.each do |i|
      if i.name == route_name
        @route_class_name = i
      end
    end

    p "Enter name of station that you want to add: "
    station_name = gets.chomp
    p "Where do you want to add station?: "
    index = gets.to_i
    @route_class_name.add_station(index, station_name)
    p @route_class_name
  
    when "remove"
    p "Enter name of route that you want to change: "
    route_name = gets.chomp

    $routes.each do |i|
      if i.name == route_name
        @route_class_name = i
      end
    end

    p "Enter name of station that you want to remove: "
    station_name = gets.chomp
    @route_class_name.remove_station(station_name)
    p @route_class_name
  
    else p "Error!"
    end
  end
end

def train_set_route
  p "Enter train name for set route: "
  train_name = gets.chomp

  for i in $trains
    if i.name == train_name
      @train_class_name = i
    end
  end

  p "Enter name of route: "
  route_name = gets.chomp

  for i in $routes
    if i.name == route_name
      @route_class_name = i
    end
  end

  @train_class_name.set_route(route_name)
end

def train_add_wagon
  p "Enter train name : "
  train_name = gets.chomp
  p "Enter type of wagon: "
  wagon_type = gets.chomp

  @train_class_name.add_wagon(wagon_type)
end

def train_remove_wagon
  p "Enter name class train: "
  train_class_name = gets.chomp 
  p "Enter type of wagon: "
  wagon_type = gets.chomp
  if @current_speed == 0 && wagons > 0
    train_class_name.remove_wagon(wagon_type)
  else  
    p "Stop the fckn train, idiot!"
  end
end

def train_move
  train_move = gets.chomp

  case train_move
  
  when "forward"
    p "Enter train that you want to move: "
    train_class_name = gets.chomp
    train_class_name.next_station

  when "back"
    p "Enter train that you want to move: "
    train_class_name = gets.chomp
    train_class_name.prev_station
  end
end

def show_stations_and_trains
  p "Enter name of route that you want to view: "
  route_class_name = gets.chomp
  route_class_name.show_stations
  p "Enter name of station that you want to for train: "
  station_class_name = gets.chomp
  station_class_name.trains
end

loop do 
  p "Choose your destiny: "
  handle_user_command
  p "print 'exit' if you want to stop"
  break if gets.chomp == "exit"
end