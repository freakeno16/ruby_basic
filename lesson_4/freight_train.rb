class FreightTrain < Train
  def add_wagon
    if @type == "freight"
      add_wagon
    else 
      p "You can't add passenger wagon to freight train"
    end
  end 
end