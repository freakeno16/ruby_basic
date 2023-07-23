require_relative 'instance_counter'
require_relative 'validate'

class Station
  @stations = {}

  include InstanceCounter
  include Validate

  attr_reader :trains, :name

  class << self
    def all
      @stations
    end
  
    def add_station(station)
      @stations[station.name] = station
    end
  end

  def initialize(name)
    @name = name
    @trains = []
    self.class.register_instance
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

  private

  def validate!
    raise "Name can't be nil!" if name.nil?
  end
end
