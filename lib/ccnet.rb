require 'hpricot'
require 'open-uri'

module BuildLights
  class CcNet
    def initialize(uri, parser = XmlParser)
      puts "CruiseControl.net url: #{uri}" if $verbose
      @doc = parser.parse(uri)
    end
  
    def failed_jobs
      @doc.search(:Project).map do |project|
        name = project[:name]
        status = project[:lastBuildStatus]
        puts "#{name} -> #{status}" if $verbose
        failed = /FAIL/i.match(status)
        name if failed
      end.compact
    end
  end
  
  class XmlParser
    def self.parse(uri)
      Hpricot::XML(open(uri))
    end
  end
end

