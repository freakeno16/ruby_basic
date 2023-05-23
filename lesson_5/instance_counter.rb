module InstanceCounter

  @@instances = 0

  def self.included(base) #self для того, чтобы included был методом данного модуля, а не класса, в который я его включу
    base.extend ClassMethods
    base.include InstanceMethods #send похуй проебали
  end

  module ClassMethods
    def instances
      @@instances
    end
  end

  module InstanceMethods

    private

    def register_instance

    end
  end
end