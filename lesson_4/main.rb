require_relative 'train.rb'
require_relative 'passenger_train.rb'
require_relative 'freight_train.rb'
require_relative 'station.rb'
require_relative 'route.rb'
require_relative 'wagons.rb'


@routes = {}
@trains = {}
@stations = {}
@wagons = {}

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

  when "show stations and trains"
    show_stations_and_trains
  end
end

def create_new_station
  p "Enter name of new station: "
  station_name = gets.chomp

  @stations[station_name] = Station.new(station_name)
  p "Stations: #{@stations}"
end

def create_new_train
  p "Enter name of new train: "
  train_name = gets.chomp

  p "Enter number of new train: "
  train_number = gets.chomp

  p "Enter train type: "
  train_type = gets.chomp
  p @trains.values.map { |t| t.name }

  case train_type
  when "passenger"
    @trains[train_name] = PassengerTrain.new(train_name, train_number)
    p "Trains: #{@trains.values.map { |t| t.name }}"
  when "freight"
    @trains[train_name] = FreightTrain.new(train_name, train_number)
    p "Trains: #{@trains.values.map { |t| t.name }}"

  else
    p "Error!"
  end
end

  def create_new_wagon
    p "Enter wagon name: "
    wagon_name = gets.chomp

    p "Enter wagon type: "
    wagon_type = gets.chomp

    @wagons[wagon_name] = Wagons.new(wagon_name, wagon_type)
    p @wagons
  end

def route_menu
  p "Enter 'new' to create new station"
  p "Enter 'manage' to manage"
  route_choice = gets.chomp

  case route_choice
  when "new"
    p "Enter name of new route: "
    route_name = gets.chomp
    p "Enter name of first station: "
    first_station = gets.chomp
    p "Enter name of last station: "
    last_station = gets.chomp

    @stations[first_station] = Station.new(first_station)

    @stations[last_station] = Station.new(last_station)
    
    @routes[route_name] = Route.new(route_name, first_station, last_station)
    p "Routes: #{@routes.values.map { |r| r.name } }"
  when "manage"
    p "Enter 'add'/'remove' to manage"
    case gets.chomp
    when "add"
      p "Enter route name that you want to change: "
      route_name = gets.chomp

      p "Enter name of station that you want to add: "
      station_name = gets.chomp

      p "Where do you want to add station?: "
      i = gets.to_i

      @routes[route_name].add_station(i, @stations[station_name].name)
      p @routes
    when "remove"
      p "Enter name of route that you want to change: " 

      route_name = gets.chomp

      p "Enter name of station that you want to remove: "
      station_name = gets.chomp

      @routes[route_name].remove_station(@stations[station_name].name)
      p @routes
    else p "Error!"
    end
  end
end

def train_set_route
  p "Enter train name for set route: "
  train_name = gets.chomp

  p "Enter name of route: "
  route_name = gets.chomp

  @trains[train_name].set_route(@routes[route_name])
  p "Your current station is #{@routes[route_name].stations.first}"
end

def train_add_wagon
  p "Enter train name: "
  train_name = gets.chomp

  p "Enter name of wagon: "
  wagon_name = gets.chomp
  
  @trains[train_name].add_wagon(@wagons[wagon_name])
  p @trains
end

def train_remove_wagon
  p "Enter train name: "
  train_name = gets.chomp

  p "Enter wagon name: "
  wagon_name = gets.chomp

  @trains[train_name].remove_wagon(wagon_name)
  p @trains
end

def train_move
  p "Where do you want to move (forward/back)?"
  train_move = gets.chomp

  case train_move
  
  when "forward"
    p "Enter train name: "
    train_name = gets.chomp

    @trains[train_name].next_station

  when "back"
    p "Enter train name: "
    train_name = gets.chomp

    @trains[train_name].prev_station
  end
end

def show_stations_and_trains
  p "Enter route name: "
  route_name = gets.chomp

  @routes[route_name].show_stations

  p "Enter name of station: "
  station_name = gets.chomp

  p @stations[station_name].trains
end

loop do 
  p "Choose your destiny: "
  handle_user_command
  p "print 'exit' if you want to stop"
  break if gets.chomp == "exit"
end
