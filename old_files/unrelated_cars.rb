class Car
  def initialize (wheels, motor, transmission)
    @wheels = wheels
    @motor = motor
    @transmission = transmission
  end
end

class Motorcycle < Car
  def initialize(wheel_number = 2)
    @wheel_number = wheel_number
    super(wheel_number, "4-cyl", "5spd")
  end
  def info
    puts @wheel_number + " " + @motor + " " + @transmission
  end
end