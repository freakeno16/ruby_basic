require_relative 'train.rb'
require_relative 'passenger_train.rb'
require_relative 'freight_train.rb'
require_relative 'station.rb'
require_relative 'route.rb'
require_relative 'wagon.rb'

def handle_user_command

  command = gets.chomp

  case command

  when "create new station"
    create_new_station

  when "create new train"
    create_new_train

  when "create new wagon"
    create_new_wagon

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

  when "show near stations"
    show_near_stations
  end
end

def create_new_station(station_name = nil)
  p "Enter name of new station: "
  station_name = station_name || gets.chomp

  Station.add_station(Station.new(station_name))
  p Station.all
end

def create_new_train
  p "Enter name of new train: "
  train_name = gets.chomp

  p "Enter number of new train: "
  train_number = gets.chomp

  p "Enter train type: "
  train_type = gets.chomp

  begin
  case train_type
  when "passenger"
    Train.add_train(PassengerTrain.new(train_name, train_number))
    p "Passenger train was created: #{PassengerTrain.new(train_name, train_number)}"
    p Train.all

  when "freight"
    Train.add_train(FreightTrain.new(train_name, train_number))
    p "Freight train was created: #{FreightTrain.new(train_name, train_number)}"
    p Train.all
  end

  rescue RuntimeError => e
    p "Error: #{e.message}, retry please"
  end
end

def create_new_wagon
  p "Enter wagon name: "
  wagon_name = gets.chomp

  p "Enter wagon type: "
  wagon_type = gets.chomp

  Wagon.add_wagon(Wagon.new(wagon_name, wagon_type))
  p Wagon.all
end

def route_menu(route_choice: nil, route_name: nil, first_station_name: nil, last_station_name: nil, manage_option: nil, i: nil, station_name: nil)
  p "Enter 'new' to create new station"
  p "Enter 'manage' to manage"
  route_choice = route_choice || gets.chomp

  case route_choice
  when "new"
    p "Enter name of new route: "
    route_name = route_name || gets.chomp
    p "Enter name of first station: "
    first_station_name = first_station_name || gets.chomp
    p "Enter name of last station: "
    last_station_name = last_station_name || gets.chomp

    first_station = Station.add_station(Station.new(first_station_name))

    last_station = Station.add_station(Station.new(last_station_name))

    Route.add_route(Route.new(route_name, first_station, last_station))
    p Route.all
  when "manage"
    p "Enter 'add'/'remove' to manage"

    manage_option = manage_option || gets.chomp

    case manage_option
    when "add"
      p "Enter route name that you want to change: "
      route_name = route_name || gets.chomp

      p "Enter name of station that you want to add: "
      station_name = station_name || gets.chomp

      p "Where do you want to add station?: "
      i = i || gets.to_i

      if Station.all.include?(station_name)
        Route.all[route_name].add_station(i, Station.all[station_name])
        p Route.all
      else 
        p "There's no such station to add!"
      end
    when "remove"
      p "Enter name of route that you want to change: " 
      route_name = route_name || gets.chomp

      p "Enter name of station that you want to remove: "
      station_name = station_name || gets.chomp

      if Station.all.include?(station_name)
        Route.all[route_name].remove_station(Station.all[station_name])
      else
        p "There's no such sttation to remove!"
      end
    end
  end
end

def train_set_route
  p "Enter train name for set route: "
  train_name = gets.chomp

  p "Enter name of route: "
  route_name = gets.chomp

  if Route.all.include?(route_name)
    Train.all[train_name].set_route(Route.all[route_name])
  else 
    p "There's no such route to set!"
  end
end

def train_add_wagon
  p "Enter train name: "
  train_name = gets.chomp

  p "Enter name of wagon: "
  wagon_name = gets.chomp

  if Wagon.all.include?(wagon_name)
    Train.all[train_name].add_wagon(Wagon.all[wagon_name])
    p Train.all[train_name]
  else 
    p "There's no such wagon to add!"
  end
end

def train_remove_wagon
  p "Enter train name: "
  train_name = gets.chomp

  p "Enter wagon name: "
  wagon_name = gets.chomp

  if Wagon.all.include?(wagon_name)
    Train.all[train_name].remove_wagon(Wagon.all[wagon_name])
    p Train.all[train_name]
  else 
    p "There's no wagon to remove!"
  end
end

def train_move
  p "Where do you want to move (forward/back)?"
  train_move = gets.chomp

  p "Enter train name: "
  train_name = gets.chomp

  case train_move
  when "forward"
    Train.all[train_name].send_to_next_station
  when "back"
    Train.all[train_name].send_to_prev_station
  end
end

def show_near_stations
  p "Enter train name: "
  train_name = gets.chomp

  Train.all[train_name].near_stations

  p "Enter name of station: "
  station_name = gets.chomp

  p "Trains on station #{station_name}: #{Station.all[station_name].trains}"
end

loop do 
  p "Choose your destiny: "
  handle_user_command
  p "print 'exit' if you want to stop"
  break if gets.chomp == "exit"
end