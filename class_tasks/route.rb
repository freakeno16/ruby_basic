require_relative 'instance_counter'
require_relative 'validate'

class Route
  @routes = {}

  include InstanceCounter
  include Validate

  attr_reader :stations, :name

  class << self
    def all
      @routes
    end

    def add_route(route)
      @routes[route.name] = route
    end
  end

  def initialize(name, starting, ending)
    @name = name
    @stations = [starting, ending]
    self.class.register_instance
    validate!
  end

  def show_stations
    stations.each { |s| p s }
  end

  def add_station(index, station)
    stations.insert(index, station)
  end

  def remove_station(station)
    stations.delete(station)
  end

  protected

  def validate!
    raise "Name can't be nil!" if name.nil?
    raise "Stations can't be nil" if stations.nil?
  end
end
