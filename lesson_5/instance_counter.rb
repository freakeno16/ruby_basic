module InstanceCounter

  def self.included(base) #self для того, чтобы included был методом данного модуля, а не класса, в который я его включу
    base.extend ClassMethods
    base.include InstanceMethods #send похуй проебали
  end

  module ClassMethods
    def instances
      @@instances ||= 0
    end

    def add_instance
      @instances ||= 0
      @instances += 1
    end
  end

  module InstanceMethods

    private

    def register_instance
      self.class.add_instance
    end
  end
end