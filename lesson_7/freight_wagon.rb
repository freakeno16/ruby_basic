class FreightWagon < Wagon
  attr_reader :name, :type, :capacity

  def initialize(name, capacity)
    super
    wagon_type = "freight"
    @capacity = capacity
  end

  def take_capacity(capacity)
    @taked_capacity = 0
    @capacity - capacity
    @taked_capacity += capacity
  end

  def taked_capacity
    @taked_capacity
  end

  def free_capacity
    @free_capacity = @capacity - @taked_capacity
  end 
end