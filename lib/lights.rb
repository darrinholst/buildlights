module BuildLights
  class Lights
    RED = 1
    GREEN = 2

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
      cmd = "br -v --house=#{house} --#{command}=#{unit}"
      puts "sending X10 command -> #{cmd}" if $verbose
      system cmd
      raise "bottlerocket command failed with status code #{$?.exitstatus}" if $?.exitstatus > 0
    end
  end  
end
