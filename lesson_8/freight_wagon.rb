class FreightWagon < Wagon
  attr_reader :name, :type, :capacity, :taked_capacity

  def initialize(name, number, capacity)
    super
    @type = 'freight'
    @capacity = capacity
  end

  def take_capacity(capacity)
    @taked_capacity = 0
    @taked_capacity += capacity
  end

  def free_capacity
    @free_capacity = @capacity - @taked_capacity
  end
end
