class PassengerTrain < Train
  attr_reader :type

  def initialize(name, number)
    super
    @type = 'passenger'
  end

  private 

  def validate!
    super
    raise "Wrong wagon type" if type != 'passenger'
  end
end
