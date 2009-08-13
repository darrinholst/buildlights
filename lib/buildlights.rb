require 'optparse'
require 'ccnet'
require 'hudson'
require 'lights'

module BuildLights
  extend self
  
  def cli(args)
    options = {}
    
    OptionParser.new do |opts|
      opts.banner = "Usage: buildlights [options]"

      opts.on("-v", "--[no-]verbose", "Run verbosely") do |v|
        puts v
      end
    end.parse!

    p options
    p ARGV
  end
end