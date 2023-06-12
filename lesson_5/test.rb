#1)ебанул модуль
module CompanyName
  attr_accessor :company_name
end

#2) 
class Station
  ...........
  @stations = {}
  ...........
  def self.all
    @stations
  end

#3) 
class Train 
  ...
  def self.find(number)
    @trains.each { |t| p t.number}
  end

#4)
module InstanceCounter
  def included(base)
    base.include InstanceMethods
    base.extend ClassMethods
  end

  @@instances = 0

  module InstanceMethods
    def instances
      @@instances
    end
  end

  module ClassMethods

    private

    def register_instance
      @@instances += 1
    end
  end
      
