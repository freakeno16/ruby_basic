# def connect
#   raise "Error, retry pls"
# end

# try = 0
# begin   
#   connect 
# rescue RuntimeError
#   try += 1
#   p "Check your connection!"
#   retry if try < 3
# ensure 
#   p "There was #{try} tryes"

# end

class Station 
  @stations = {}

  attr_reader :trains, :name
  attr_writer :name

  class << self
    def all
      @stations
    end
  
    def add_station(station)
      @stations[station.name] = station
    end
  end

  def valid?
    validate!
  rescue
    false
  end


  def initialize(name)
    @name = name
    @trains = []
    validate!
  end
  
  def add_train(train)
    @trains << train
  end

  def send_train(train)
    @trains.delete(train)
  end

  def trains_by_type(type)
    @trains.select { |t| t.type == type }
  end

  protected 

  def validate!
    raise "Name lenght must be at least 3 symbols!" if name.length < 3
    p "Good!"
    true
  end
end
