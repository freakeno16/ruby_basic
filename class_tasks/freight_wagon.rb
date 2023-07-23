class FreightWagon < Wagon
  attr_reader :name, :type, :capacity, :taked_capacity

  def initialize(name, number, capacity)
    super
    @type = 'freight'
    @capacity = capacity
  end

  def take_capacity(capacity)
    @taked_capacity ||= 0
    if free_capacity >= capacity
      @taked_capacity += capacity
    else 
      p "There's no free capacity"
      p "#{@free_capacity} capacity left"
    end
  end

  def free_capacity
    @free_capacity = @capacity - @taked_capacity
  end
end
