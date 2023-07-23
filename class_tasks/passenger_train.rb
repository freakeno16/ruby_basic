class PassengerTrain < Train
  attr_reader :train_type

  def initialize(name, number)
    super
    @train_type = 'passenger'
  end
end
