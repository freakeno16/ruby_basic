class FreightTrain < Train
  attr_reader :type

  def initialize(name, number)
    super
    @type = 'freight'
    validate!
  end
end
