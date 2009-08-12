require 'build-lights'
require 'yaml'

class BuildLights::Config
  HOME_LOCATION = "#{ENV['HOME']}"
  SYSTEM_LOCATION = "/etc"
    
  def initialize
    [HOME_LOCATION, SYSTEM_LOCATION].each do |path|
      config_file = File.join(path, ".buildlights")
      puts config_file
      if File.exists?(config_file) && File.file?(config_file)
        config = YAML.load_file(config_file)
        
        if(config)
          config.each_pair do |key, value|
            self.class.send(:attr_reader, key.to_sym)
            instance_variable_set("@#{key}".to_sym, value)
          end
        end

        return
      end
    end
    
    raise "No configuration file found"
  end
  
  def method_missing(*args)
  end
end
