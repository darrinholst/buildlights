require 'bottle_rocket'

class Lights
  GREEN = 1
  RED = 2

  def initialize(implementation = BottleRocket)
    @implementation = implementation
  end
  
  def success
    @implementation.turn_on GREEN
    @implementation.turn_off RED
  end
  
  def failed
    @implementation.turn_on RED
    @implementation.turn_off GREEN
  end
end