module InstanceCounter
  def self.included(base)
    base.extend ClassMethods
    # base.include InstanceMethods
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

  #   module InstanceMethods

  #     private

  #     def register_instance
  #       self.class.register_instance
  #     end
  #   end
end
