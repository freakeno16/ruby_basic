require_relative 'company_name'
require_relative 'validate'
require_relative 'instance_counter'

class Wagon
  @wagons = {}

  include CompanyName
  include Validate
  include InstanceCounter

  attr_reader :name, :type

  class << self
    def all
      @wagons
    end

    def add_wagon(wagon)
      @wagons[wagon.name] = wagon
    end
  end

  def initialize(name, type)
    @name = name
    @type = type
    self.class.register_instance
    validate!
  end

  protected

  def validate!
    raise "Name can't be nil!" if name.nil?
    raise 'Wrong wagon type!' if type != 'passenger' && type != 'freight'
  end
end
