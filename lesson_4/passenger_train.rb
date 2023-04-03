class PassengerTrain < Train
  def add_wagon
    if @type == "passenger"
      add_wagon
    else 
      p "You can't add freight wagon to passenger train"
    end
  end 
end 