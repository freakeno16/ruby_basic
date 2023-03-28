class Train
  attr_reader :number, :type, :wagons
  attr_accessor :current_speed, :route
  
  @@index = 0

  def initialize(number, type, wagons)
    @number = number
    @type = type
    @wagons = wagons.length
    @current_speed = 0 
  end

  def speed_up(speed)
    @current_speed += speed
    p "Your current speed: #{@current_speed}"
  end

  def stop
    @current_speed -= @current_speed
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
    if @current_speed == 0
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
    @@index += 1
    @current_station = @route[@@index]
    p "Current station is #{@current_station}"
  end

  def prev_station
    @@index -= 1
    @current_station = @route[@@index]
    p "Current station is #{@current_station}"
  end

  def prev_curr_next
    p "current: #{@route[@@index]}"
    p "previous: #{route[@@index - 1]}"
    p "next: #{route[@@index + 1]}"
  end
end