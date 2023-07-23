class PassengerWagon < Wagon
  attr_reader :name, :type, :places

  def initialize(name, number, places)
    super
    @type = 'passenger'
    @places = places
  end

  def take_place
    @taked_places ||= 0
    if free_places == 0
      p "There's no free places left"
    else
      @taked_places += 1
    end
  end

  def taked_places
    @taked_places ||= 0
  end

  def free_places
    @free_places = @places - @taked_places
  end
end
