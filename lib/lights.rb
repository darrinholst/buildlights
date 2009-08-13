module BuildLights
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
  
  class BottleRocket
    def self.turn_on(unit, house='A')
      send('on', unit, house)
    end

    def self.turn_off(unit, house='A')
      send('off', unit, house)
    end

    private

    def self.send(command, unit, house)
      puts `br -v --house=#{house} --#{command}=#{unit}`
    end
  end  
end
