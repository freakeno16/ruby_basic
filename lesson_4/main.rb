require_relative 'main_train.rb'
require_relative 'passenger_train.rb'
require_relative 'freight_train.rb'
require_relative 'station.rb'
require_relative 'route.rb'

def handle_user_command(command)

  case command

  when "create new station"
    create_new_station

  when "create new train"
    create_new_train

  when "create new route"
    create_new_route

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
  p "Enter class of new station: "
  station_class_name = gets.chomp

  p "Enter name of new station: "
  station_name = gets.chomp

  station_class_name = Station.new(station_name)
  p station_class_name
end

def create_new_train
  p "Enter class name of new train: "
  train_class_name = gets.chomp

  p "Enter name of new train: "
  train_name = gets.chomp

  p "Enter type of new train: "
  train_type = gets.chomp

  case train_type 

  when "passenger"
   train_class_name = PassengerTrain.new(train_name)
   p train_class_name

  when "freight"
    train_class_name = FreightTrain.new(train_name)
    p train_class_name

  else 
    p "Error!"
  end
end

def create_new_route

  p "Enter class name of new route: "
  route_class_name = gets.chomp
  p "Enter name of first station: "
  first_station = gets.chomp
  p "Enter name of last station: "
  last_station = gets.chomp
  
  route_class_name = Route.new([first_station, last_station])
end

def route_menu

  route_choice = gets.chomp

  case route_choice
  
  when "add"
    p "Enter name of station that you want to add: "
    station_name = gets.chomp
    route_class_name.add_station(index, station_name)
  
  when "remove"
    p "Enter name of station that you want to remove: "
    station_name = gets.chomp
    route_class_name.remove_station(station_name)
  end
end 

def train_set_route
  p "Enter train class name for set route: "
  train_class_name = gets.chomp
  p "Enter name of route: "
  route_name = gets.chomp
  train_class_name.set_route(route_name)
end

def train_add_wagon
  p "Enter name class train: "
  train_class_name = gets.chomp
  p "Enter type of wagon: "
  wagon_type = gets.chomp
  if @current_speed == 0
    train_class_name.add_wagon(wagon_type)
  else 
    p "Stop the fckn train, idiot!"
  end
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
