require 'optparse'
require 'ccnet'
require 'hudson'
require 'lights'

module BuildLights
  extend self
  
  def cli(args)
    urls = []
    
    OptionParser.new do |opts|
      opts.banner = "Usage: buildlights [options]"

      opts.on("-v", "--[no-]verbose", "Run verbosely") do |v|
        $verbose = true
      end

      opts.on("--hudson [URL]", "Hudson url") do |url|
        urls << [Hudson, url]
      end

      opts.on("--ccnet [URL]", "CruiseControl.net url") do |url|
        urls << [CcNet, url]
      end
    end.parse!
    
    raise "must supply at least one url to check" if urls.empty?
    
    failed_jobs = []
    
    urls.each do |url|
      failed_jobs << url.first.new(url.last).failed_jobs
    end
    
    Lights.new.send(failed_jobs.flatten.empty? ? :success : :failed)
  end
end