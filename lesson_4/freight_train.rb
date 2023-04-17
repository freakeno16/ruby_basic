class FreightTrain < Train
  attr_reader :train_type
  def initialize(name, number)
    super
    @train_type = "freight"
  end
end