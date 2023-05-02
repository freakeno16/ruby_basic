class Train
  attr_reader :name, :number, :type, :wagons, :route 
  attr_accessor :current_speed, :index

  TRAIN_TYPES = [
    PASSENGER = "passenger",
    FREIGHT = "freight"
  ].freeze
  
  def initialize(name, number, type)
    raise StandardError("undefined train type") unless TRAIN_TYPES.include?(type)
    @name = name
    @number = number
    @type = type
    @wagons = []
    @current_speed = 0 
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
    if @current_speed == 0 
      @wagons << wagon 
    else 
    p "Stop the fckn train, idiot!"
    end
  end
  
  def remove_wagon(wagon)
    if @current_speed == 0 && @wagons.any?
      @wagons.delete(wagon)
      p @wagons
    else  
      p "Stop the fckn train, idiot!"
    end
  end
  
  def set_route(route)
    @route = route
    p "Route '#{@route}' has been set"
  end
  
  def send_to_next_station
    i = @route.index(@current_station)

    if @route[i + 1]
      @current_station = @route[i + 1]
      p "Current station is #{@current_station}"
    else
      p "This is a last station in the route"
    end
  end
  
  def send_to_prev_station
    i = @route.index(@current_station)
    
    if @route[i - 1]
      @current_station = @route[i - 1]
      p "Current station is #{@current_station}"
    else
      p "This is a last station in the route"
    end
  end
  
  def near_stations
    i = @route.index(@current_station)
    p "current: #{@route[i]}"
    p "previous: #{route[i - 1]}"
    p "next: #{route[@index + 1]}"
  end
end

