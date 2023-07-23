class FreightTrain < Train
  attr_reader :type

  def initialize(name, number)
    super
    @type = 'freight'
    validate!
  end

  private

  def validate!
    raise "Wrong wagon type" if type != 'freight'
  end
end