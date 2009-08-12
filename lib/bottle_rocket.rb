class BuildLights::BottleRocket
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