class PassengerWagon < Wagon
  attr_reader :name, :type, :places

  def initialize(name, number, places)
    super
    @type = "passenger"
    @places = places
  end

  def take_place
    @taked_places ||= 0
    @places - 1
    @taked_places += 1
  end

  def taked_places
    @taked_places ||= 0
  end 

  def free_places
    @free_places = @places - @taked_places
  end
end
