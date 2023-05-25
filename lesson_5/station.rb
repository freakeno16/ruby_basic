class Station 
  @stations = {}
  
  include InstanceCounter

  attr_reader :trains, :name

  class << self
    def all_routes
      @routes
    end
  
    def add_route(route)
      @routes[route.name] = route
    end
  end

  def initialize(name)
    @name = name
    @trains = []
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
end