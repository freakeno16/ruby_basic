module InstanceCounter
  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods
    def instances
      @instances
    end

    def register_instance
      @instances ||= 0
      @instances += 1
    end
  end
end
