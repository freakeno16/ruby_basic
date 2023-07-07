class PassengerTrain < Train
  attr_reader :type
  def initialize(name, number)
    super
    @type = "passenger"
  end
end